/*
 This file was autogenerated by tags.py 
 */

#import "GCRepositoryCitationRelationship.h"

#import "GCObject_internal.h"
#import "GCEntity_internal.h"

#import "GCCallNumberAttribute.h"
#import "GCNoteEmbeddedAttribute.h"
#import "GCNoteReferenceRelationship.h"

@implementation GCRepositoryCitationRelationship {
	NSMutableArray *_noteReferences;
	NSMutableArray *_noteEmbeddeds;
	NSMutableArray *_callNumbers;
}

// Methods:
/** Initializes and returns a repositoryCitation.

 
 @return A new repositoryCitation.
*/
+(GCRepositoryCitationRelationship *)repositoryCitation
{
	return [[self alloc] init];
}
- (id)init
{
	self = [super _initWithType:@"repositoryCitation"];
	
	if (self) {
		// initialize ivars, if any:
		_noteReferences = [NSMutableArray array];
		_noteEmbeddeds = [NSMutableArray array];
		_callNumbers = [NSMutableArray array];
	}
	
	return self;
}


// Properties:
@dynamic notes;

- (NSMutableArray *)mutableNoteReferences {
    return [self mutableArrayValueForKey:@"noteReferences"];
}

- (NSUInteger)countOfNoteReferences {
	return [_noteReferences count];
}

- (id)objectInNoteReferencesAtIndex:(NSUInteger)index {
    return [_noteReferences objectAtIndex:index];
}
 
- (void)insertObject:(id)obj inNoteReferencesAtIndex:(NSUInteger)index {
	NSParameterAssert([obj isKindOfClass:[GCNoteReferenceRelationship class]]);
	
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
													      value:self.type
														  table:@"Misc"];
    
	[(GCRepositoryCitationRelationship *)[self.undoManager prepareWithInvocationTarget:self] removeObjectFromNoteReferencesAtIndex:index];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
    [_noteReferences insertObject:obj atIndex:index];
}

- (void)removeObjectFromNoteReferencesAtIndex:(NSUInteger)index {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCRepositoryCitationRelationship *)[self.undoManager prepareWithInvocationTarget:self] insertObject:_noteReferences[index] inNoteReferencesAtIndex:index];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	[((GCObject *)_noteReferences[index]) setValue:nil forKey:@"describedObject"];
	
    [_noteReferences removeObjectAtIndex:index];
}
	

- (NSMutableArray *)mutableNoteEmbeddeds {
    return [self mutableArrayValueForKey:@"noteEmbeddeds"];
}

- (NSUInteger)countOfNoteEmbeddeds {
	return [_noteEmbeddeds count];
}

- (id)objectInNoteEmbeddedsAtIndex:(NSUInteger)index {
    return [_noteEmbeddeds objectAtIndex:index];
}
 
- (void)insertObject:(id)obj inNoteEmbeddedsAtIndex:(NSUInteger)index {
	NSParameterAssert([obj isKindOfClass:[GCNoteEmbeddedAttribute class]]);
	
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
													      value:self.type
														  table:@"Misc"];
    
	[(GCRepositoryCitationRelationship *)[self.undoManager prepareWithInvocationTarget:self] removeObjectFromNoteEmbeddedsAtIndex:index];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
    [_noteEmbeddeds insertObject:obj atIndex:index];
}

- (void)removeObjectFromNoteEmbeddedsAtIndex:(NSUInteger)index {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCRepositoryCitationRelationship *)[self.undoManager prepareWithInvocationTarget:self] insertObject:_noteEmbeddeds[index] inNoteEmbeddedsAtIndex:index];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	[((GCObject *)_noteEmbeddeds[index]) setValue:nil forKey:@"describedObject"];
	
    [_noteEmbeddeds removeObjectAtIndex:index];
}
	

- (NSMutableArray *)mutableCallNumbers {
    return [self mutableArrayValueForKey:@"callNumbers"];
}

- (NSUInteger)countOfCallNumbers {
	return [_callNumbers count];
}

- (id)objectInCallNumbersAtIndex:(NSUInteger)index {
    return [_callNumbers objectAtIndex:index];
}
 
- (void)insertObject:(id)obj inCallNumbersAtIndex:(NSUInteger)index {
	NSParameterAssert([obj isKindOfClass:[GCCallNumberAttribute class]]);
	
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
													      value:self.type
														  table:@"Misc"];
    
	[(GCRepositoryCitationRelationship *)[self.undoManager prepareWithInvocationTarget:self] removeObjectFromCallNumbersAtIndex:index];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
    [_callNumbers insertObject:obj atIndex:index];
}

- (void)removeObjectFromCallNumbersAtIndex:(NSUInteger)index {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCRepositoryCitationRelationship *)[self.undoManager prepareWithInvocationTarget:self] insertObject:_callNumbers[index] inCallNumbersAtIndex:index];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	[((GCObject *)_callNumbers[index]) setValue:nil forKey:@"describedObject"];
	
    [_callNumbers removeObjectAtIndex:index];
}
	

@end

