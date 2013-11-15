﻿#!/usr/bin/env python

import sys, argparse
import json
import re
from string import Template

specialClasses = [ #don't generate classes for these
	'GCRecord',
	'GCEntity',
	'GCTrailerEntity',
	'GCChangeInfoAttribute'
];

##########################################################################################

def classify(name, type):
	if type == name:
		return classify(type, '')
	if type:
		return 'GC%s%s%s%s' % (name[0].upper(), name[1:], type[0].upper(), type[1:])
	else:
		return 'GC%s%s' % (name[0].upper(), name[1:])

##########################################################################################

def pluralize(tagInfo, key):
	if not tagInfo.has_key(key):
		return '%ss' % key
	return tagInfo[key]['plural']

##########################################################################################

propertyT = Template('/// $doc\n@property (nonatomic) $type *$name;\n')

singularPropertyT = Template("""
- (id)$name
{
	return _$name;
}
	
- (void)set$capName:(id)obj
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[($selfClass *)[uM prepareWithInvocationTarget:self] set${capName}:_$name];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if (_$name) {
		[(id)_$name setValue:nil forKey:@"describedObject"];
	}
	
	[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	
	[obj setValue:self forKey:@"describedObject"];
	
	_$name = obj;
}
""")

multiplePropertyT = Template("""@synthesize $name = _$name;

@dynamic mutable$capName;
- (NSMutableArray *)mutable$capName
{
	return [self mutableArrayValueForKey:@"$name"];
}

- (id)objectIn${capName}AtIndex:(NSUInteger)idx
{
	return [_$name objectAtIndex:idx];
}

- (NSUInteger)countOf$capName
{
	return [_$name count];
}

- (void)insertObject:(id)obj in${capName}AtIndex:(NSUInteger)idx
{
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[($selfClass *)[uM prepareWithInvocationTarget:self] removeObjectFrom${capName}AtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	[_$name insertObject:obj atIndex:idx];
}

- (void)removeObjectFrom${capName}AtIndex:(NSUInteger)idx
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[($selfClass *)[uM prepareWithInvocationTarget:self] insertObject:_$name[idx] in${capName}AtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	[_$name[idx] setValue:nil forKey:@"describedObject"];
	
	[_$name removeObjectAtIndex:idx];
}
""")

def property(tagInfo, selfClass, key, type, doc, forwardDeclarations, is_plural, is_required, is_property_group=False):
	name = pluralize(tagInfo, key) if is_plural else key
	ivar = None
	definition = ''
	implementation = ''
	if not is_property_group:
		forwardDeclarations.add(classify(key, type))
	if is_plural:
		if is_property_group:
			definition = propertyT.substitute(
				type='NSArray',
				name=name,
				doc=doc
			)
			implementation = '@dynamic %s;' % name
		else:
			definition = '%s%s' % (propertyT.substitute(
				type='NSArray',
				name=name,
				doc='. '.join([doc, classify(key, type)])
			), propertyT.substitute(
				type='NSMutableArray',
				name='mutable%s%s' % (name[0].upper(), name[1:]),
				doc='. Contains instances of '.join([doc, name])
			))
			implementation = multiplePropertyT.substitute(
				capName='%s%s' % (name[:1].upper(), name[1:]),
				name=name,
				selfClass=selfClass
			)
			ivar = 'NSMutableArray *_%s' % name
	else:
		definition = propertyT.substitute(
			type=classify(key, type),
			name=name,
			doc='. '.join([doc, ' NB: required property.' if is_required else ''])
		)
		implementation = singularPropertyT.substitute(
			name=name,
			capName='%s%s' % (name[:1].upper(), name[1:]),
			selfClass=selfClass
		)
		ivar = '%s *_%s' % (classify(key, type), name)

	return definition, implementation, ivar

##########################################################################################

def decamelcase(name):
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1 \2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1 \2', s1).lower()

def expand_group(tagInfo, className, group, propertyDeclarations, propertyImplementations, ivars, forwardDeclarations):
	section = decamelcase(pluralize(tagInfo, group))
	docHeader = '@name Accessing %s' % section
	defaultDoc = '%s\n\n/// Property for accessing the following properties' % docHeader
	
	dec, imp, ivar = property(tagInfo, className, group[1:], '', defaultDoc, forwardDeclarations, True, False, is_property_group=True)
					
	propertyDeclarations.append(dec)
	propertyImplementations.append(imp)
	if ivar: ivars.append(ivar)
	
	props = []
	if tagInfo[group].has_key('variants'):
		props.extend(tagInfo[group]['variants'])
	if tagInfo[group].has_key('subClasses'):
		props.extend(tagInfo[group]['subClasses'])
	
	for variant in props:
		if variant.has_key('groupName'):
			dec, imp, ivar = property(tagInfo, className, group[1:], '', defaultDoc, forwardDeclarations, True, False, is_property_group=True)
			
			if dec not in propertyDeclarations:
				propertyDeclarations.append(dec)
				propertyImplementations.append(imp)
				if ivar: ivars.append(ivar)
			
			expand_group(tagInfo, className, variant['groupName'], propertyDeclarations, propertyImplementations, ivars, forwardDeclarations)
			continue
		print >> sys.stderr, '		PROCESSING VARIANT "%s": %s' % (variant['name'], tagInfo[variant['name']])

		doc = '%s \n\n///Also contained in %ss. %s' % (docHeader, group[1:], variant['doc'] if variant.has_key('doc') else '')

		dec, imp, ivar = property(tagInfo, className, variant['name'], tagInfo[variant['name']]['objectType'], doc, forwardDeclarations, variant['max'] == 'M' or variant['max'] > 1, variant['min'] == 1)
		propertyDeclarations.append(dec)
		propertyImplementations.append(imp)
		if ivar: ivars.append(ivar)

##########################################################################################

constructorDeclarationT = Template("""/// @name Initializing

/** Initializes and returns a $name.

 $doc
 @return A new $name.
*/
+(instancetype)$name$extra""")

constructorBodyT = Template("""{
	return [[self alloc] init$extra];
}""")

def constructors(key, type):
	cons = dict()
	if type in ('entity', 'record'):
		cons[constructorDeclarationT.substitute(
			returnType=classify(key, type),
			name=key, 
			extra='InContext:(GCContext *)context',
			doc='@param context The context in which to create the entity.'
		)] = constructorBodyT.substitute(
			objectType=type,
			name=key,
			extra='InContext:context'
		)
	else:
		cons[constructorDeclarationT.substitute(
			returnType=classify(key, type),
			name=key, 
			extra='',
			doc=''
		)] = constructorBodyT.substitute(
			objectType=type,
			name=key,
			extra=''
		)
		if type == 'attribute':
			cons[constructorDeclarationT.substitute(
				returnType=classify(key, type),
				name=key, 
				extra='WithValue:(GCValue *)value',
				doc='@param value The value as a GCValue object.'
			)] = constructorBodyT.substitute(
				objectType=type,
				name=key,
				extra='WithValue:value'
			)
			cons[constructorDeclarationT.substitute(
				returnType=classify(key, type),
				name=key, 
				extra='WithGedcomStringValue:(NSString *)value',
				doc='@param value The value as an NSString.'
			)] = constructorBodyT.substitute(
				objectType=type,
				name=key,
				extra='WithGedcomStringValue:value'
			)
	return cons

##########################################################################################

headerFileT = Template("""/*
 This file was autogenerated by tags.py 
 */

#import "${superClass}.h"

$forwardDeclarations

/**
 $doc
*/
@interface $className : $superClass

// Methods:
$methods

// Properties:
$propertyDeclarations

@end
""")

implementationFileT = Template("""/*
 This file was autogenerated by tags.py 
 */

#import "$className.h"

#import "GCTagAccessAdditions.h"
#import "GCObject_internal.h"
#import "Gedcom_internal.h"

@implementation $className {
$ivars
}

// Methods:
$methods

// Properties:
$propertyImplementations

@end
""")

initT = Template("""- (instancetype)init$extraDef
{
	self = [super init$extraImp];
	
	if (self) {
		// initialize ivars, if any:
$initProperties
	}
	
	return self;
}
""")

def process(tagInfo, key):
	if key[0] == '@': return
	print >> sys.stderr, 'PROCESSING KEY "%s": %s' % (key, tagInfo[key])
	methodDefs = []
	methodImps = []
	forwardDeclarations = set()
	propertyDeclarations = []
	propertyImplementations = []
	ivars = []
	
	tagDict = tagInfo[key]
	
	if tagDict['className'] in specialClasses:
		print >> sys.stderr, 'SKIPPING KEY "%s"' % key
		return
	
	if key[0] != '!':
		cons = constructors(key, tagDict['objectType'])
		
		for declaration in sorted(cons):
			methodDefs.append('%s;' % declaration)
			methodImps.append('%s\n%s' % (declaration, cons[declaration]))
	
	# properties
	for prop in tagDict['validSubTags']:
		print >> sys.stderr, '	PROCESSING SUBTAG %s' % prop
		if prop.has_key('groupName'):
			expand_group(tagInfo, tagDict['className'], prop['groupName'], propertyDeclarations, propertyImplementations, ivars, forwardDeclarations)
		elif prop.has_key('subClassName'):
			expand_group(tagInfo, tagDict['className'], prop['subClassName'], propertyDeclarations, propertyImplementations, ivars, forwardDeclarations)
		elif prop.has_key('name'):
			dec, imp, ivar = property(tagInfo, tagDict['className'], prop['name'], tagInfo[prop['name']]['objectType'], prop['doc'] if prop.has_key('doc') else '', forwardDeclarations, prop['max'] == 'M' or prop['max'] > 1, prop['min'] == 1)
			propertyDeclarations.append(dec)
			propertyImplementations.append(imp)
			if ivar: ivars.append(ivar)
	
	# initializers
	methodImps.append(initT.substitute(
		type=key,
		initProperties="\n".join(['\t\t%s = [NSMutableArray array];' % x[16:] for x in ivars if x[:14] == 'NSMutableArray']),
		extraDef='InContext:(GCContext *)context' if tagDict['objectType'] in ('entity', 'record') else '',
		extraImp='InContext:context' if tagDict['objectType'] in ('entity', 'record') else ''
	))
	
	h_file = open('Gedcom/_Generated/generated_headers/%s.h' % tagDict['className'], 'w')
	h_file.write(headerFileT.substitute(
		superClass=tagDict['superClass'],
		className=tagDict['className'],
		forwardDeclarations="\n".join(sorted([("@class %s;" % x) for x in forwardDeclarations])),
		doc=tagDict['doc'] if tagDict.has_key('doc') else '',
		methods="\n".join(methodDefs),
		propertyDeclarations="\n".join(propertyDeclarations)
	))
	h_file.close()
	
	m_file = open('Gedcom/_Generated/generated_implementations/%s.m' % tagDict['className'], 'w')
	m_file.write(implementationFileT.substitute(
		className=tagDict['className'],
		methods="\n".join(methodImps),
		propertyImplementations="\n".join(propertyImplementations),
		ivars="\n".join(['\t%s;' % x for x in ivars])
	))
	m_file.close()
		
	print >> sys.stderr, 'DONE PROCESSING %s' % key

##########################################################################################

def propagate(sourceDict, variantDict):
	print >> sys.stderr, 'PROPAGATING VALUES FROM "%s" TO "%s"' % (sourceDict['name'], variantDict)
	
	variantDict['parent'] = sourceDict['key']
	
	if sourceDict.has_key('valueType') and not variantDict.has_key('valueType'):
		variantDict['valueType'] = sourceDict['valueType']
	if sourceDict.has_key('objectType') and not variantDict.has_key('objectType'):
		variantDict['objectType'] = sourceDict['objectType']
	if sourceDict.has_key('allowsNil') and not variantDict.has_key('allowsNil'):
		variantDict['allowsNil'] = sourceDict['allowsNil']
	
	print >> sys.stderr, 'DONE PROPAGATING VALUES FROM "%s" TO "%s"' % (sourceDict['name'], variantDict)

##########################################################################################

def set_defaults(tagInfo, key, tagDict):
	# key
	tagDict['key'] = key
	
	# name
	tagDict['name'] = key[1:] if key[0] in ('!', '@') else key
	
	# pluralName
	if not tagDict.has_key('plural'):
		tagDict['plural'] = '%ss' % tagDict['name']
		
	# validSubTags
	if not tagDict.has_key('validSubTags'):
		tagDict['validSubTags'] = []

##########################################################################################

if __name__=='__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument("input_path", help="path to tags.json")
	args = parser.parse_args()
	
	f = open(args.input_path)
	tagInfo = json.load(f)
	
	# defaults
	for key, tagDict in tagInfo.iteritems():
		set_defaults(tagInfo, key, tagDict)
	
	# propagate
	for key in ('!entity', '!record', '!individualEvent', '!individualAttribute', '!individualLDSOrdinance', '!familyEvent', '!eventDetail'):
		tagDict = tagInfo[key]
		for subClass in tagDict['subClasses']:
			if subClass.has_key('name'):
				propagate(tagDict, tagInfo[subClass['name']])
	
	for key, tagDict in tagInfo.iteritems():
		if key[0] != '@':
			tagDict['className'] = classify(tagDict['name'], tagDict['objectType'])
	
	for key, tagDict in tagInfo.iteritems():
		if key[0] != '@':
			if tagDict.has_key('parent'):
				tagDict['superClass'] = tagInfo[tagDict['parent']]['className']
			else:
				tagDict['superClass'] = classify(tagDict['objectType'], '')
	
	# process
	for key, tagDict in tagInfo.iteritems():
		if not key[0] == '@':
			process(tagInfo, key)
	
	h_file = open('Gedcom/_Generated/GCObjects_generated.h', 'w')
	for key in sorted(tagInfo.keys()):
		if tagInfo[key].has_key('className'):
			if tagInfo[key]['className'] not in specialClasses:
				h_file.write('#import "%s.h"\n' % tagInfo[key]['className']);
	h_file.close()
	
	print >> sys.stderr, 'DUMPING JSON'
	
	print json.dumps(tagInfo)
