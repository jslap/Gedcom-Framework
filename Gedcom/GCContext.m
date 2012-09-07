//
//  GCXRefStore.m
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 28/03/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import "GCContext.h"

#import "GCEntity.h"
#import "GCTag.h"

#import "GCContextDelegate.h"

@implementation GCContext {
	NSMutableDictionary *xrefStore;
	NSMutableDictionary *xrefBlocks;
    NSMutableSet *storedEntities; //to avoid expensive allKeysForObject: calls if we don't have it stored
    
    NSLock *callbackLock;
}

static __strong NSMutableDictionary *_contexts = nil;

- (id)init
{
	return [self initWithName:[[NSUUID UUID] UUIDString]];
}

- (id)initWithName:(NSString *)name
{
    NSParameterAssert(![_contexts objectForKey:name]);
    
	self = [super init];
	
	if (self) {
        _name = name;
        
        xrefStore = [NSMutableDictionary dictionary];
        xrefBlocks = [NSMutableDictionary dictionary];
        storedEntities = [NSMutableSet set];
        
        callbackLock = [[NSLock alloc] init];
	}
    
    if (!_contexts) {
        _contexts = [NSMutableDictionary dictionary];
    }
    
    _contexts[name] = self;
	
	return self;
}

+ (id)context
{
	return [[self alloc] init];
}

+ (id)contextWithName:(NSString *)name
{
    GCContext *context = _contexts[name];
    
    if (!context) {
        context = [[self alloc] initWithName:name];
    }
    
    return context;
}

+ (NSDictionary *)contextsByName
{
    return [_contexts copy];
}

- (void)setXref:(NSString *)xref forEntity:(GCEntity *)obj
{
    NSParameterAssert(xref);
    
    if ([storedEntities containsObject:obj]) {
        for (NSString *key in [xrefStore allKeysForObject:obj]) {
            [xrefStore removeObjectForKey:key];
        }
    }
    
    //NSLog(@"Storing %@ for %@", xref, obj);
    
    xrefStore[xref] = obj;
    [storedEntities addObject:obj];
	
    [callbackLock lock];
	if (xrefBlocks[xref]) {
		for (void (^block) (NSString *) in xrefBlocks[xref]) {
			block(xref);
		}
		[xrefBlocks removeObjectForKey:xref];
	}
    [callbackLock unlock];
}

- (NSString *)xrefForEntity:(GCEntity *)obj
{
    if (!obj) {
        return nil;
    }
    NSParameterAssert([[obj gedTag] code]);
    
    //NSLog(@"looking for %@ in %@", obj, self);
    
    NSString *xref = nil;
    for (NSString *key in [xrefStore allKeys]) {
        //NSLog(@"%@: %@", key, [xrefStore objectForKey:key]);
        if (xrefStore[key] == obj) {
            xref = key;
        }
    }
    
    if (xref == nil) {
        int i = 0;
        do {
            xref = [NSString stringWithFormat:@"@%@%d@", [[obj gedTag] code], ++i]; 
        } while (xrefStore[xref]);
        
        [self setXref:xref forEntity:obj];
    }
    
    //NSLog(@"xref: %@", xref);
    
    return xref;
}

- (GCEntity *)entityForXref:(NSString *)xref
{
    return xrefStore[xref];
}

- (void)registerCallbackForXref:(NSString *)xref usingBlock:(void (^)(NSString *xref))block
{
    NSParameterAssert(xref);
    
    [callbackLock lock];
    
	if ([self entityForXref:xref]) {
		block(xref);
	} else	if (xrefBlocks[xref]) {
		[xrefBlocks[xref] addObject:[block copy]];
	} else {
		xrefBlocks[xref] = [NSMutableSet setWithObject:[block copy]];
	}
    
    [callbackLock unlock];
}

#pragma mark NSCoding conformance

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
    
    if (self) {
        xrefStore = [aDecoder decodeObjectForKey:@"xrefStore"];
        xrefBlocks = [aDecoder decodeObjectForKey:@"xrefBlocks"];
        storedEntities = [NSSet setWithArray:[xrefStore allKeys]];
        
        callbackLock = [[NSLock alloc] init];
	}
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:xrefStore forKey:@"xrefStore"];
    [aCoder encodeObject:xrefBlocks forKey:@"xrefBlocks"];
}

#pragma mark Description

//COV_NF_START
- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ (name: %@ xrefStore: %@)", [super description], _name, xrefStore];
}
//COV_NF_END

#pragma mark Xref link methods

- (void)activateXref:(NSString *)xref
{
    if (_delegate && [_delegate respondsToSelector:@selector(context:didReceiveActionForEntity:)]) {
        [_delegate context:self didReceiveActionForEntity:[self entityForXref:xref]];
    }
}

@end
