//
//  GCTag.h
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 23/03/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import "GCValue.h"

#import <Foundation/Foundation.h>

typedef struct {
    NSInteger min;
    NSInteger max;
} GCAllowedOccurrences;

/**
 
 Tags are immutable singleton instances that help mapping between GCNode and GCObject.
 
 A tag knows its Gedcom code, what subtags are allowed, what type value a property has, etc.
 
 */
@interface GCTag : NSObject <NSCopying, NSCoding>

#pragma mark Entry points

/// @name Obtaining tags

/** Returns a dictionary of the available tags. The keys are the names of the tags.
 
 @return A dictionary of tags.
 */
+ (NSDictionary *)tagsByName;

/** Returns a tag with the given name.
 
 @param name The name of the requested tag.
 @return A tag or `nil` if none exists.
 */
+ (GCTag *)tagNamed:(NSString *)name;

/** Returns a root tag with the given code.
 
 @param code The code of the requested tag.
 @return A tag or `nil` if none exists.
 */
+ (GCTag *)rootTagWithCode:(NSString *)code;

#pragma mark Subtags

/// @name Accessing subtags

/** Returns the subtag of the receiver with the given code and type. The type can be `attribute` or `relationship`.
 
 @param code The name of the requested subtag.
 @param type The type of the requested subtag.
 @return A tag or `nil` if none exists.
 */
- (GCTag *)subTagWithCode:(NSString *)code type:(NSString *)type;

/** Returns the subtag of the receiver with the given name.
 
 @param name The name of the requested subtag.
 @return A tag or `nil` if none exists.
 */
- (GCTag *)subTagWithName:(NSString *)name;

/** Returns an array of the names of properties of a certain group, such as an individuals `individualEvent`s.
 
 @param groupName The name of a group.
 @return An array of tags or `nil` if there is no such group.
 */
- (NSArray *)subTagsInGroup:(NSString *)groupName;

/** Returns whether a given subtag is a valid subtag of the receiver.
 
 @param tag A GCTag object.
 @return `YES` if the given subtag is valid, otherwise `NO`.
 */
- (BOOL)isValidSubTag:(GCTag *)tag;

/** Returns a struct with the minimum and maximum allowed occurrences of a given subtag on the receiver.
 
 GCAllowedOccurrences is a { `min`, `max` } struct of two NSIntegers
 
 @param tag A GCTag object.
 @return A GCAllowedOccurrences struct.
 */
- (GCAllowedOccurrences)allowedOccurrencesOfSubTag:(GCTag *)tag;

#pragma mark Objective-C properties

/// @name Accessing properties

/// The Gedcom code of the receiver.
@property (readonly, nonatomic) NSString *code;

/// The human readable name of the receiver.
@property (readonly) NSString *name;

/// The human readable name of the receiver in plural.
@property (readonly, nonatomic) NSString *pluralName;

/// The localized name of the receiver.
@property (readonly, nonatomic) NSString *localizedName;

/// Whether the tag is custom or not.
@property (readonly, nonatomic) BOOL isCustom;

/// An ordered collection of valid subtags.
@property (readonly, nonatomic) NSOrderedSet *validSubTags;

/// The class type of the tag. Can be any subclass of GCObject.
@property (readonly) Class objectClass;

/// A class indicating which type its value is. Will be `nil` if the tag is not an attribute-tag. See GCValue.
@property (readonly) Class valueType;

/// A collection of allowed values; will be empty if the tag is not an attribute-tag or there are no restrictions on values.
@property (readonly) NSArray *allowedValues;

/// A class indicating which type its target is. Will be `nil` if the tag is not a relationship-tag.
@property (readonly) Class targetType;

/// If the tag is a relationship-tag and the relationship is two-way (such as FAMC &lt;-&gt; CHIL) the reverse tag is provided. Can be `nil`.
@property (readonly, nonatomic) GCTag *reverseRelationshipTag;

@end
