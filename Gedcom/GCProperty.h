//
//  GCProperty.h
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 27/03/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCObject.h"

/**
 
 Abstract property. Subclasses are GCAttribute and GCRelationship.
 
 */
@interface GCProperty : GCObject

#pragma mark Objective-C properties

/// @name Accessing properties

/// The object being described by the receiver.
@property (weak, nonatomic, readonly) GCObject *describedObject;

@end

@interface GCProperty (GCGedcomLoadingAdditions)

#pragma mark Initialization

/// @name Creating and initializing properties

/** Initializes and creates a property whose type and properties reflect the GCNode.
 
 Cannot be used to initialize the GCProperty superclass, but must be used on the GCAttribute and GCRelationship subclasses.
 
 @param object The object being described.
 @param node A GCNode. Its tag code must correspond to a valid property on the object.
 @return A new attribute.
 */
- (id)initWithGedcomNode:(GCNode *)node onObject:(GCObject *)object;

@end
