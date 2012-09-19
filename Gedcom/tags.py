﻿#!/usr/bin/env python

import json
from string import Template

specialClasses = [ #don't generate classes for these
	'GCHeaderEntity',
	'GCTrailerEntity',
	'GCNoteEntity'
];

# Templates:
propertyT = Template('/// Autogenerated accessors for $name. $description\n@property $type *$name;')
dynamicT = Template('@dynamic $name;')
forwardT = Template('@class $name;')

declarationT = Template("""/** Autogenerated convenience constructor for $name
 $doc
*/
+($returnType *)$name$extra""")
bodyT = Template("""{
	return [self ${objectType}WithType:@"$name"$extra];
}""")

headerFileT = Template("""/*
 This file was autogenerated by tags.py 
 */

#import "GCEntity.h"
#import "GCAttribute.h"
#import "GCRelationship.h"

#pragma mark Forward declarations

$forwardDeclarations

#pragma mark Class definitions

$classDefinitions
""")

implementationFileT = Template("""/*
 This file was autogenerated by tags.py 
 */

#import "GCObjects_generated.h"

$classImplementations
""")

definitionT = Template("""/**
 Autogenerated $name class.
*/
@interface $name : $superClass

// Methods:
$methods

// Properties:
$properties

@end
""")
implementationT = Template("""@implementation $name

// Methods:
$methods

// Properties:
$dynamics

@end
""")
initT = Template("""- (id)init
{
	return [super initWithType:@"$type"];
}
""")

def classify(name, type):
	if type:
		return 'GC%s%s%s%s' % (name[0].upper(), name[1:], type[0].upper(), type[1:])
	else:
		return 'GC%s%s' % (name[0].upper(), name[1:])

def pluralize(s):
	if not tags.has_key(s):
		return '%ss' % s
	if tags[s].has_key('plural'):
		return tags[s]['plural']
	else:
		return '%ss' % s

forwardDeclarations = set()

def property(key, type, is_plural, is_required, is_super_variant=False):
	name = pluralize(key) if is_plural else key
	h_line = propertyT.substitute(
		type='NSMutableArray' if is_plural else classify(key, type),
		name=name, 
		description='%s%s' % ('An array of %s' % classify(key, type) if is_plural and not is_super_variant else '', ' NB: required property' if is_required else '')
	)
	if not is_super_variant and not is_plural:
		forwardDeclarations.add(forwardT.substitute(name=classify(key, type)))
	m_line = dynamicT.substitute(name=name)
	return h_line, m_line

def constructors(key, type):
	cons = dict()
	if type == 'entity':
		cons[declarationT.substitute(
			returnType=classify(key, type),
			name=key, 
			extra='InContext:(GCContext *)context',
            doc='@param context The context in which to create the entity.'
		)] = bodyT.substitute(
			objectType=tags[key]['objectType'],
			name=key,
			extra=' inContext:context'
		)
	else:
		cons[declarationT.substitute(
			returnType=classify(key, type),
			name=key, 
			extra='',
			doc=''
		)] = bodyT.substitute(
			objectType=tags[key]['objectType'],
			name=key,
			extra=''
		)
		if type == 'attribute':
			cons[declarationT.substitute(
				returnType=classify(key, type),
				name=key, 
				extra='WithValue:(GCValue *)value',
				doc='@param value The value as a GCValue object.'
			)] = bodyT.substitute(
				objectType=tags[key]['objectType'],
				name=key,
				extra=' value:value'
			)
			cons[declarationT.substitute(
				returnType=classify(key, type),
				name=key, 
				extra='WithGedcomStringValue:(NSString *)value',
				doc='@param value The value as an NSString.'
			)] = bodyT.substitute(
				objectType=tags[key]['objectType'],
				name=key,
				extra=' gedcomStringValue:value'
			)
		elif type == 'relationship':
			cons[declarationT.substitute(
				returnType=classify(key, type),
				name=key, 
				extra='WithTarget:(GCEntity *)target',
				doc='@param target The relationship\'s target entity.'
			)] = bodyT.substitute(
				objectType=tags[key]['objectType'],
				name=key,
				extra=' target:target'
			)
	return cons

f = open('tags.json')
tags = json.load(f)

classDefinitions = []
classImplementations = []

def propagate(key):
	print 'PROPAGATING VALUES FOR "%s"' % key
	if not tags[key].has_key('validSubTags'):
		tags[key]['validSubTags'] = []
	for variant in tags[key]['variants']:
		if variant.has_key('groupName'):
			propagate(variant['groupName'])
			continue
		if not tags[variant['name']].has_key('validSubTags'):
			tags[variant['name']]['validSubTags'] = []
		tags[variant['name']]['validSubTags'].extend([x for x in tags[key]['validSubTags'] if x not in tags[variant['name']]['validSubTags']])
		if tags[key].has_key('objectType') and not tags[variant['name']].has_key('objectType'):
			tags[variant['name']]['objectType'] = tags[key]['objectType']

for key in sorted(tags):
	if key[0] == '@':
		propagate(key)

def expand_group(group, properties, dynamics):
	for variant in tags[group]['variants']:
		if variant.has_key('groupName'):
			expand_group(variant['groupName'], properties, dynamics)
			continue
		print '		PROCESSING VARIANT "%s": %s' % (variant['name'], tags[variant['name']])
		pro, dyn = property(variant['name'], tags[variant['name']]['objectType'], variant['max'] == 'M', variant['min'] == 1)
		properties.append(pro)
		dynamics.append(dyn)


for key in sorted(tags):
	print 'PROCESSING KEY "%s": %s' % (key, tags[key])
	if key[0] != '@':
		if not tags[key]['objectType'] in ['entity', 'attribute', 'relationship'] or classify(key, tags[key]['objectType']) in specialClasses:
			print 'SKIPPING KEY "%s"' % key
			continue
		cons = constructors(key, tags[key]['objectType'])
		
		methodDefs = []
		methodImps = []
		
		methodImps.append(initT.substitute(type=key))
		
		for declaration in sorted(cons):
			methodDefs.append('%s;' % declaration)
			methodImps.append('%s\n%s' % (declaration, cons[declaration]))
		
		properties = []
		dynamics = []
		
		if tags[key].has_key('validSubTags'):
			for prop in tags[key]['validSubTags']:
				print '	PROCESSING SUBTAG %s' % prop
				if prop.has_key('groupName'):
					pro, dyn = property(prop['groupName'][1:], '', True, False, is_super_variant=True)
					
					properties.append(pro)
					dynamics.append(dyn)
					
					expand_group(prop['groupName'], properties, dynamics)
					
				else:
					pro, dyn = property(prop['name'], tags[prop['name']]['objectType'], prop['max'] == 'M', prop['min'] == 1)
					properties.append(pro)
					dynamics.append(dyn)
		
		classDefinitions.append(definitionT.substitute(
			name=classify(key, tags[key]['objectType']),
			superClass=classify(tags[key]['objectType'], ''),
			methods="\n".join(methodDefs),
			properties="\n".join(properties)
		))
		classImplementations.append(implementationT.substitute(
			name=classify(key, tags[key]['objectType']),
			methods="\n".join(methodImps),
			dynamics="\n".join(dynamics)
		))
	
	print 'DONE PROCESSING %s' % key

h_file = open('GCObjects_generated.h', 'w')
h_file.write(headerFileT.substitute(
	forwardDeclarations="\n".join(sorted(forwardDeclarations)),
	classDefinitions="\n".join(classDefinitions)
))
h_file.close()

m_file = open('GCObjects_generated.m', 'w')
m_file.write(implementationFileT.substitute(
	classImplementations="\n".join(classImplementations)
))
m_file.close()
