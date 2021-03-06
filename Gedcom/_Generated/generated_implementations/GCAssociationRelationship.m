/*
 This file was autogenerated by tags.py 
 */

#import "GCAssociationRelationship.h"

#import "GCTagAccessAdditions.h"
#import "GCObject_internal.h"
#import "Gedcom_internal.h"

@implementation GCAssociationRelationship {
	GCRecordTypeAttribute *_recordType;
	GCRelationshipDescriptorAttribute *_relationshipDescriptor;
	NSMutableArray *_noteReferences;
	NSMutableArray *_noteEmbeddeds;
	NSMutableArray *_sourceCitations;
	NSMutableArray *_sourceEmbeddeds;
}

// Methods:
/// @name Initializing

/** Initializes and returns a association.

 
 @return A new association.
*/
+(instancetype)association
{
	return [[self alloc] init];
}
- (instancetype)init
{
	self = [super init];
	
	if (self) {
		// initialize ivars, if any:
		_noteReferences = [NSMutableArray array];
		_noteEmbeddeds = [NSMutableArray array];
		_sourceCitations = [NSMutableArray array];
		_sourceEmbeddeds = [NSMutableArray array];
	}
	
	return self;
}


// Properties:

- (id)recordType
{
	return _recordType;
}
	
- (void)setRecordType:(id)obj
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] setRecordType:_recordType];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if (_recordType) {
		[(id)_recordType setValue:nil forKey:@"describedObject"];
	}
	
	[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	
	[obj setValue:self forKey:@"describedObject"];
	
	_recordType = obj;
}


- (id)relationshipDescriptor
{
	return _relationshipDescriptor;
}
	
- (void)setRelationshipDescriptor:(id)obj
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] setRelationshipDescriptor:_relationshipDescriptor];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if (_relationshipDescriptor) {
		[(id)_relationshipDescriptor setValue:nil forKey:@"describedObject"];
	}
	
	[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	
	[obj setValue:self forKey:@"describedObject"];
	
	_relationshipDescriptor = obj;
}

@dynamic notes;
@synthesize noteReferences = _noteReferences;

@dynamic mutableNoteReferences;
- (NSMutableArray *)mutableNoteReferences
{
	return [self mutableArrayValueForKey:@"noteReferences"];
}

- (id)objectInNoteReferencesAtIndex:(NSUInteger)idx
{
	return [_noteReferences objectAtIndex:idx];
}

- (NSUInteger)countOfNoteReferences
{
	return [_noteReferences count];
}

- (void)insertObject:(id)obj inNoteReferencesAtIndex:(NSUInteger)idx
{
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] removeObjectFromNoteReferencesAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	[_noteReferences insertObject:obj atIndex:idx];
}

- (void)removeObjectFromNoteReferencesAtIndex:(NSUInteger)idx
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] insertObject:_noteReferences[idx] inNoteReferencesAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	[_noteReferences[idx] setValue:nil forKey:@"describedObject"];
	
	[_noteReferences removeObjectAtIndex:idx];
}

@synthesize noteEmbeddeds = _noteEmbeddeds;

@dynamic mutableNoteEmbeddeds;
- (NSMutableArray *)mutableNoteEmbeddeds
{
	return [self mutableArrayValueForKey:@"noteEmbeddeds"];
}

- (id)objectInNoteEmbeddedsAtIndex:(NSUInteger)idx
{
	return [_noteEmbeddeds objectAtIndex:idx];
}

- (NSUInteger)countOfNoteEmbeddeds
{
	return [_noteEmbeddeds count];
}

- (void)insertObject:(id)obj inNoteEmbeddedsAtIndex:(NSUInteger)idx
{
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] removeObjectFromNoteEmbeddedsAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	[_noteEmbeddeds insertObject:obj atIndex:idx];
}

- (void)removeObjectFromNoteEmbeddedsAtIndex:(NSUInteger)idx
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] insertObject:_noteEmbeddeds[idx] inNoteEmbeddedsAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	[_noteEmbeddeds[idx] setValue:nil forKey:@"describedObject"];
	
	[_noteEmbeddeds removeObjectAtIndex:idx];
}

@dynamic sources;
@synthesize sourceCitations = _sourceCitations;

@dynamic mutableSourceCitations;
- (NSMutableArray *)mutableSourceCitations
{
	return [self mutableArrayValueForKey:@"sourceCitations"];
}

- (id)objectInSourceCitationsAtIndex:(NSUInteger)idx
{
	return [_sourceCitations objectAtIndex:idx];
}

- (NSUInteger)countOfSourceCitations
{
	return [_sourceCitations count];
}

- (void)insertObject:(id)obj inSourceCitationsAtIndex:(NSUInteger)idx
{
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] removeObjectFromSourceCitationsAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	[_sourceCitations insertObject:obj atIndex:idx];
}

- (void)removeObjectFromSourceCitationsAtIndex:(NSUInteger)idx
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] insertObject:_sourceCitations[idx] inSourceCitationsAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	[_sourceCitations[idx] setValue:nil forKey:@"describedObject"];
	
	[_sourceCitations removeObjectAtIndex:idx];
}

@synthesize sourceEmbeddeds = _sourceEmbeddeds;

@dynamic mutableSourceEmbeddeds;
- (NSMutableArray *)mutableSourceEmbeddeds
{
	return [self mutableArrayValueForKey:@"sourceEmbeddeds"];
}

- (id)objectInSourceEmbeddedsAtIndex:(NSUInteger)idx
{
	return [_sourceEmbeddeds objectAtIndex:idx];
}

- (NSUInteger)countOfSourceEmbeddeds
{
	return [_sourceEmbeddeds count];
}

- (void)insertObject:(id)obj inSourceEmbeddedsAtIndex:(NSUInteger)idx
{
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] removeObjectFromSourceEmbeddedsAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	[_sourceEmbeddeds insertObject:obj atIndex:idx];
}

- (void)removeObjectFromSourceEmbeddedsAtIndex:(NSUInteger)idx
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCAssociationRelationship *)[uM prepareWithInvocationTarget:self] insertObject:_sourceEmbeddeds[idx] inSourceEmbeddedsAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	[_sourceEmbeddeds[idx] setValue:nil forKey:@"describedObject"];
	
	[_sourceEmbeddeds removeObjectAtIndex:idx];
}


@end
