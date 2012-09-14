//
//  NSObject+GCContextDelegate.h
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 16/05/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GCContext.h"

@class GCEntity;
@class GCNode;
@class GCTag;
@class GCObject;

/**
 
 A set of optional methods that can be implemented by an object.
 
 If a GCContext has a delegate, it will call these if they are implemented.
 
 */
@interface NSObject (GCContextDelegate)

/** Will be called...
 
 TODO rename...
 
 @param context The context that sent the message. 
 @param entity The entity.
 */
- (void)context:(GCContext *)context didReceiveActionForEntity:(GCEntity *)entity;

/** Will be called when an unknown tag is encountered in a context.
 
 The delegate can choose to use the information contained in the node to alter the object, for instance the non-standard tag FAM._UMR could be used to add a note to the family entity that they were unmarried.
 
 @param context The context that sent the message.
 @param tag The unknown tag.
 @param node The complete node including value and subnodes.
 @param object The object the node was intended for.
 */
- (void)context:(GCContext *)context didEncounterUnknownTag:(GCTag *)tag forNode:(GCNode *)node onObject:(GCObject *)object;

/** Will be called when a GCContext's entity count changes during parsing.
 
 @param context The context that sent the message.
 @param entityCount The new count.
 */
- (void)context:(GCContext *)context didUpdateEntityCount:(NSInteger)entityCount;

/** Will be called when a GCContext's is done parsing.
 
 @param context The context that sent the message.
 @param entityCount The new count.
 */
- (void)context:(GCContext *)context didFinishWithEntityCount:(NSInteger)entityCount;

@end
