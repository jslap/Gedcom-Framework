//
//  GCObject.m
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 27/03/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import "GCObject.h"
#import "GCNode.h"
#import "GCTag.h"

#import "GCContext.h"

#import "GCEntity.h"
#import "GCHeader.h"
#import "GCProperty.h"
#import "GCAttribute.h"
#import "GCRelationship.h"

#import "GCMutableOrderedSetProxy.h"

@interface GCObject () 

@end

@implementation GCObject {
    NSMutableDictionary *_properties;
}

#pragma mark Initialization

- (id)initWithType:(NSString *)type
{
    self = [super init];
    
    NSParameterAssert([self class] != [GCObject class]);
    NSParameterAssert([self class] != [GCProperty class]);
    
    if (self) {
        _tag = [GCTag tagNamed:type];
        _properties = [NSMutableDictionary dictionary];
    }
    
    return self;    
}

#pragma mark GCProperty access

- (void)addProperty:(GCProperty *)property
{
    NSParameterAssert([property isKindOfClass:[GCProperty class]]);
    NSParameterAssert([[property gedTag] isCustom] || [[self validProperties] containsObject:[property type]]);
    
    if ([property describedObject]) {
        if ([property describedObject] == self) {
            return;
        }
        [[property describedObject] removeProperty:property];
    }
    
    [property setValue:self forKey:@"primitiveDescribedObject"];
    
    if ([self allowsMultiplePropertiesOfType:[property type]]) {
        NSMutableOrderedSet *set = [_properties valueForKey:[property type]];
        
        if (!set) {
            set = [NSMutableOrderedSet orderedSet];
            [_properties setValue:set forKey:[property type]];
        }
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:[set count]];
        
        [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexSet forKey:[property type]];
        
        [set addObject:property];
        
        [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexSet forKey:[property type]];
    } else {
        [self willChangeValueForKey:[property type]];
        
        [self removeProperty:[_properties valueForKey:[property type]]];
        [_properties setObject:property forKey:[property type]];
        
        [self didChangeValueForKey:[property type]];
    }
}

- (void)removeProperty:(GCProperty *)property
{
    if (property == nil) {
        return;
    }
    
    NSParameterAssert([property isKindOfClass:[GCProperty class]]);
    NSParameterAssert([property describedObject] == self);
    
    if ([self allowsMultiplePropertiesOfType:[property type]]) {
        NSMutableOrderedSet *set = [_properties valueForKey:[property type]];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:[set indexOfObject:property]];
        
        [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexSet forKey:[property type]];
        
        [set removeObject:property];
        
        [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexSet forKey:[property type]];
    } else {
        [self willChangeValueForKey:[property type]];
        
        [_properties removeObjectForKey:[property type]];
        
        [self didChangeValueForKey:[property type]];
    }
    
    [property setValue:nil forKey:@"primitiveDescribedObject"];
}

- (NSOrderedSet *)validProperties
{
	NSMutableOrderedSet *valid = [NSMutableOrderedSet orderedSetWithCapacity:[[_tag validSubTags] count]];
	
	for (id subTag in [_tag validSubTags]) {
		[valid addObject:[subTag name]];
	}
	
	return valid;
}

- (BOOL)allowsMultiplePropertiesOfType:(NSString *)type
{
    GCAllowedOccurrences occurrences = [_tag allowedOccurrencesOfSubTag:[GCTag tagNamed:type]];
    
    return occurrences.max > 1;
}

#pragma mark NSKeyValueCoding overrides

void setValueForKeyHelper(id obj, NSString *key, id value) {
    if ([value isKindOfClass:[GCProperty class]]) {
        [obj addProperty:value];
    } else if ([value isKindOfClass:[GCValue class]]) {
        [obj addAttributeWithType:key value:value];
    } else if ([value isKindOfClass:[GCEntity class]]) {
        [obj addRelationshipWithType:key target:value];
    } else {
		NSException *exception = [NSException exceptionWithName:@"GCInvalidKVCValueTypeException"
														 reason:[NSString stringWithFormat:@"Invalid value %@ for setValue:forKey:", value]
													   userInfo:nil];
		@throw exception;
    }
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([[self validProperties] containsObject:key]) {
        if ([self allowsMultiplePropertiesOfType:key]) {
            NSParameterAssert([value respondsToSelector:@selector(countByEnumeratingWithState:objects:count:)]);
            [self setNilValueForKey:key]; //clean first
            for (id item in value) {
                setValueForKeyHelper(self, key, item);
            }
        } else {
            setValueForKeyHelper(self, key, value);
        }
    } else {
        [super setValue:value forKey:key];
    }
}

- (void)setNilValueForKey:(NSString *)key
{
    if ([[self validProperties] containsObject:key]) {
        [_properties removeObjectForKey:key];
    } else {
        [super setNilValueForKey:key];
    }
}

- (id)valueForKey:(NSString *)key
{
    if ([[self validProperties] containsObject:key]) {
        id obj = [_properties objectForKey:key];
        
        if ([self allowsMultiplePropertiesOfType:key]) {
            if (obj == nil) {
                obj = [NSMutableOrderedSet orderedSet];
            }
            //return a fresh proxy that will act when added to/removed from.
            return [[GCMutableOrderedSetProxy alloc] initWithMutableOrderedSet:obj
                                                                      addBlock:^(id obj) {
                                                                          [self addProperty:obj];
                                                                      }
                                                                   removeBlock:^(id obj) {
                                                                       [self removeProperty:obj];
                                                                   }];
        } else {
            return obj;
        }
    } else {
        return [super valueForKey:key];
    }
}

- (id)valueForKeyPath:(NSString *)keyPath
{
    NSMutableArray *keys = [[keyPath componentsSeparatedByString:@"."] mutableCopy];
    NSString *firstKey = [keys objectAtIndex:0];
    [keys removeObjectAtIndex:0];
    
    if ([[self validProperties] containsObject:firstKey]) {
        id obj = [_properties valueForKey:firstKey];
        
        if ([keys count] == 0) {
            return obj;
        }
        
        if ([obj isKindOfClass:[NSOrderedSet class]]) {
            NSMutableOrderedSet *values = [NSMutableOrderedSet orderedSetWithCapacity:[obj count]];
            
            for (id item in obj) {
                id val = [item valueForKeyPath:[keys componentsJoinedByString:@"."]];
                if (val) {
                    [values addObject:val];
                }
            }
            
            return values;
        } else {
            return [obj valueForKeyPath:[keys componentsJoinedByString:@"."]];
        }
    } else {
        return [super valueForKeyPath:keyPath];
    }
}

#pragma mark Gedcom access

- (NSArray *)subNodes
{
    NSMutableArray *subNodes = [NSMutableArray arrayWithCapacity:[_properties count]];
    
    for (NSString *propertyName in [self validProperties]) {
        id obj = [_properties valueForKey:propertyName];
        
        if (obj) {
            if ([obj isKindOfClass:[NSOrderedSet class]]) {
                NSArray *sorted = [obj sortedArrayUsingComparator:^(id obj1, id obj2) {
                    return [obj1 compare:obj2];
                }];
                for (GCProperty *subObj in sorted) {
                    [subNodes addObject:[subObj gedcomNode]];
                }
            } else {
                [subNodes addObject:[obj gedcomNode]];
            }
        }
    }
	
	return subNodes;
}

#pragma mark Comparison

- (NSComparisonResult)compare:(id)other
{
    //subclasses override to get actual result.
    return NSOrderedSame;
}

#pragma mark Equality

- (BOOL)isEqualTo:(id)other
{
    return [[self gedcomString] isEqualToString:[other gedcomString]];
}
/*
- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    }
    
    return [[self gedcomString] isEqualToString:[other gedcomString]];
}

- (NSUInteger)hash
{
    return [[self gedcomString] hash];
}*/

#pragma mark NSCoding conformance

- (id)initWithCoder:(NSCoder *)aDecoder
{
    [self doesNotRecognizeSelector:_cmd];    
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self doesNotRecognizeSelector:_cmd];    
}

#pragma mark Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (type: %@)", [super description], [self type]];
}

#pragma mark Objective-C properties

- (NSString *)type
{
    return [_tag name];
}

- (id)properties
{
	NSMutableOrderedSet *properties = [NSMutableOrderedSet orderedSet];
	
	for (id property in [_properties allValues]) {
		if ([property respondsToSelector:@selector(countByEnumeratingWithState:objects:count:)]) {
            for (id p in property) {
                [properties addObject:p];
            }
		} else {
			[properties addObject:property];
		}
	}
	
	return [[GCMutableOrderedSetProxy alloc] initWithMutableOrderedSet:properties
                                                              addBlock:^(id obj) {
                                                                  [self addProperty:obj];
                                                              }
                                                           removeBlock:^(id obj) {
                                                               [self removeProperty:obj];
                                                           }];
}

- (void)setProperties:(NSMutableOrderedSet *)properties
{
    _properties = [NSMutableDictionary dictionary];
    
    for (id property in properties) {
        NSParameterAssert([property isKindOfClass:[GCProperty class]]);
        [self addProperty:property];
    }
}

- (NSString *)gedcomString
{
    return [[self gedcomNode] gedcomString];
}

- (void)setGedcomString:(NSString *)gedcomString
{
    NSArray *nodes = [GCNode arrayOfNodesFromString:gedcomString];
    
    NSParameterAssert([nodes count] == 1);
    
    GCNode *node = [nodes lastObject];
    
    NSParameterAssert([[[self gedTag] code] isEqualToString:[node gedTag]]);
    
    if ([node xref]) {
        NSParameterAssert([[node xref] isEqualToString:[[self context] xrefForEntity:(GCEntity *)self]]);
    }
    
    NSMutableOrderedSet *originalProperties = [[self properties] mutableCopy];
    
    //NSLog(@"originalProperties: %@", originalProperties);
    
    for (GCNode *subNode in [node subNodes]) {
        GCProperty *property = [GCProperty propertyForObject:self withGedcomNode:subNode];
        [originalProperties removeObject:property];
    }
    
    //NSLog(@"originalProperties: %@", originalProperties);
    
    //remove the left over objects:
    for (GCProperty *property in originalProperties) {
        [self removeProperty:property];
    }
}

@synthesize gedTag = _tag;

@dynamic context;
@dynamic gedcomNode;

@end

@implementation GCObject (GCConvenienceMethods)

- (void)addAttributeWithType:(NSString *)type value:(GCValue *)value
{
    [self addProperty:[GCAttribute attributeWithType:type value:value]];
}

- (void)addRelationshipWithType:(NSString *)type target:(GCEntity *)target
{
    GCRelationship *relationship = [GCRelationship relationshipWithType:type];
    
    [self addProperty:relationship];
    
    [relationship setTarget:target];
    
	//[self addProperty:[GCRelationship relationshipWithType:type target:target]];
}

- (void)addPropertyWithGedcomNode:(GCNode *)node
{
    [GCProperty propertyForObject:self withGedcomNode:node];
}

- (id)propertiesFulfillingBlock:(BOOL (^)(GCProperty *property))block
{
	NSMutableOrderedSet *properties = [NSMutableOrderedSet orderedSet];
	
	for (id property in [self properties]) {
		if (block(property)) {
			[properties addObject:property];
		}
	}
	
	return [[GCMutableOrderedSetProxy alloc] initWithMutableOrderedSet:properties
                                                              addBlock:^(id obj) {
                                                                  [self addProperty:obj];
                                                              }
                                                           removeBlock:^(id obj) {
                                                               [self removeProperty:obj];
                                                           }];
}


- (id)attributes
{
    return [self propertiesFulfillingBlock:^BOOL(GCProperty *property) {
        return [property isKindOfClass:[GCAttribute class]];
    }];
}

- (id)relationships
{
    return [self propertiesFulfillingBlock:^BOOL(GCProperty *property) {
        return [property isKindOfClass:[GCRelationship class]];
    }];
}

@end

@implementation GCObject (GCCodingHelpers)

- (void)decodeProperties:(NSCoder *)aDecoder
{
    _properties = [aDecoder decodeObjectForKey:@"properties"];
}

- (void)encodeProperties:(NSCoder *)aCoder
{
    [aCoder encodeObject:_properties forKey:@"properties"];
}

@end

@implementation GCObject (GCValidationMethods)

BOOL validateValueTypeHelper(NSString *key, id value, Class type, NSError **error) {
    if (![value isKindOfClass:type]) {
        if (NULL != error) {
            *error = [NSError errorWithDomain:@"GCErrorDoman" 
                                         code:-1 
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                               [NSString stringWithFormat:@"Value %@ is incorrect type for key %@ (should be %@)", value, key, type], NSLocalizedDescriptionKey,
                                               nil]];
        }
        return NO;
    } else {
        return YES;
    }
}

BOOL validateTargetTypeHelper(NSString *key, id target, Class type, NSError **error) {
    if (![target isKindOfClass:type]) {
        if (NULL != error) {
            *error = [NSError errorWithDomain:@"GCErrorDoman" 
                                         code:-1 
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                               [NSString stringWithFormat:@"Target %@ is incorrect type for key %@ (should be %@)", target, key, type], NSLocalizedDescriptionKey,
                                               nil]];
        }
        return NO;
    } else {
        return YES;
    }
}

BOOL validatePropertyHelper(NSString *key, GCProperty *property, GCTag *tag, NSError **error) {
    if ([tag objectClass] == [GCAttribute class]) {
        if ([(GCAttribute *)property value] == nil) {
            //TODO check if value is required
            return YES;
        } else if (!validateValueTypeHelper(key, [(GCAttribute *)property value], [tag valueType], error)) {
            return NO;
        }
    }
    
    if ([tag objectClass] == [GCRelationship class]) {
        //TODO 
        if (!validateValueTypeHelper(key, [(GCRelationship *)property target], [GCEntity class], error)) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)validateObject:(NSError **)outError
{
    for (id propertyKey in [self validProperties]) {
        GCTag *subTag = [[self gedTag] subTagWithName:propertyKey];
        
        NSInteger propertyCount = 0;
        
        if ([self allowsMultiplePropertiesOfType:propertyKey]) {
            propertyCount = [[self valueForKey:propertyKey] count];
            for (id property in [self valueForKey:propertyKey]) {
                validatePropertyHelper(propertyKey, property, subTag, outError);
            }
        } else {
            propertyCount = [self valueForKey:propertyKey] ? 1 : 0;
            
            validatePropertyHelper(propertyKey, [self valueForKey:propertyKey], subTag, outError);
        }
        
        GCAllowedOccurrences allowedOccurrences = [[self gedTag] allowedOccurrencesOfSubTag:subTag];
        
        if (propertyCount > allowedOccurrences.max) {
            if (NULL != outError) {
                *outError = [NSError errorWithDomain:@"GCErrorDoman" 
                                                code:-1 
                                            userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                      [NSString stringWithFormat:@"Too many values for key %@", propertyKey], NSLocalizedDescriptionKey,
                                                      nil]];
            }
            
            return NO;
        }
        
        if (propertyCount < allowedOccurrences.min) {
            if (NULL != outError) {
                *outError = [NSError errorWithDomain:@"GCErrorDoman" 
                                                code:-1 
                                            userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                      [NSString stringWithFormat:@"Too few values for key %@", propertyKey], NSLocalizedDescriptionKey,
                                                      nil]];
            }
            
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)validateValue:(id *)ioValue forKey:(NSString *)inKey error:(NSError **)outError
{
    GCTag *subTag = [[self gedTag] subTagWithName:inKey];
    
    validatePropertyHelper(inKey, [self valueForKey:inKey], subTag, outError);
    
    if ([self allowsMultiplePropertiesOfType:inKey]) {
        if ([[self valueForKey:inKey] count] + 1 > [[self gedTag] allowedOccurrencesOfSubTag:subTag].max) {
            if (NULL != outError) {
                *outError = [NSError errorWithDomain:@"GCErrorDoman" 
                                                code:-1 
                                            userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                      [NSString stringWithFormat:@"Too many values for key %@", inKey], NSLocalizedDescriptionKey,
                                                      nil]];
            }
            return NO;
        }
    }
    
    return YES;
}

@end