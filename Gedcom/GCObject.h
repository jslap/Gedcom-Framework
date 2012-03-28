//
//  GCObject.h
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 27/03/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GCNode;

@class GCTag;
@class GCProperty;
@class GCAttribute;
@class GCRelationship;

@interface GCObject : NSObject

#pragma mark Initialization

- (id)initWithType:(NSString *)type;

#pragma mark Convenience constructors

+ (id)objectWithGedcomNode:(GCNode *)node;

#pragma mark GCProperty access

- (NSOrderedSet *)validProperties;

- (void)addProperty:(GCProperty *)property;
- (void)addAttribute:(GCAttribute *)attribute;
- (void)addRelationship:(GCRelationship *)relationship;

#pragma mark Gedcom access

- (NSArray *)subNodes;

#pragma mark Cocoa properties

@property (readonly) NSString *type;

@property (readonly) NSArray *properties;
@property (readonly) NSArray *attributes;
@property (readonly) NSArray *relationships;

@property (readonly) GCTag *gedTag;
@property (readonly) GCNode *gedcomNode;

@end
