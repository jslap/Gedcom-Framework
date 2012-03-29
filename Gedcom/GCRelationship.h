//
//  GCRelationnship.h
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 27/03/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCProperty.h"

#import "GCEntity.h"

@interface GCRelationship : GCProperty

#pragma mark Convenience constructors

+ (id)relationshipForObject:(GCObject *)object withGedcomNode:(GCNode *)node;

+ (id)relationshipForObject:(GCObject *)object withType:(NSString *)type;
+ (id)relationshipForObject:(GCObject *)object withType:(NSString *)type target:(GCEntity *)target;

@property GCEntity *target;

@end