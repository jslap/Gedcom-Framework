/*
 This file was autogenerated by tags.py 
 */

#import "GCHeaderEntity.h"

#import "GCObject_internal.h"
#import "GCProperty_internal.h"

#import "GCCharacterSetAttribute.h"
#import "GCCopyrightAttribute.h"
#import "GCDestinationAttribute.h"
#import "GCFileAttribute.h"
#import "GCGedcomAttribute.h"
#import "GCHeaderDateAttribute.h"
#import "GCHeaderSourceAttribute.h"
#import "GCLanguageAttribute.h"
#import "GCNoteEmbeddedAttribute.h"
#import "GCPlaceFormatSpecifierAttribute.h"
#import "GCSubmissionReferenceRelationship.h"
#import "GCSubmitterReferenceRelationship.h"

@implementation GCHeaderEntity {
	GCHeaderSourceAttribute *_headerSource;
	NSMutableArray *_destinations;
	GCHeaderDateAttribute *_headerDate;
	GCSubmitterReferenceRelationship *_submitterReference;
	NSMutableArray *_submissionReferences;
	GCFileAttribute *_file;
	GCCopyrightAttribute *_copyright;
	GCGedcomAttribute *_gedcom;
	GCCharacterSetAttribute *_characterSet;
	GCLanguageAttribute *_language;
	GCPlaceFormatSpecifierAttribute *_placeFormatSpecifier;
	GCNoteEmbeddedAttribute *_noteEmbedded;
}

// Methods:
/** Initializes and returns a header.

 @param context The context in which to create the entity.
 @return A new header.
*/
+(GCHeaderEntity *)headerInContext:(GCContext *)context
{
	return [[self alloc] initInContext:context];
}
- (id)initInContext:(GCContext *)context
{
	self = [super _initWithType:@"header" inContext:context];
	
	if (self) {
		// initialize ivars, if any:
		_destinations = [NSMutableArray array];
		_submissionReferences = [NSMutableArray array];
	}
	
	return self;
}


// Properties:

- (void)setHeaderSource:(GCProperty *)obj
{
	if (_headerSource) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_headerSource = (id)obj;
}

- (GCHeaderSourceAttribute *)headerSource
{
	return _headerSource;
}


- (NSMutableArray *)mutableDestinations {
    return [self mutableArrayValueForKey:@"destinations"];
}

- (NSUInteger)countOfDestinations {
	return [_destinations count];
}

- (id)objectInDestinationsAtIndex:(NSUInteger)index {
    return [_destinations objectAtIndex:index];
}
 
- (void)insertObject:(GCProperty *)obj inDestinationsAtIndex:(NSUInteger)index {
	NSParameterAssert([obj isKindOfClass:[GCDestinationAttribute class]]);
	if (obj.describedObject == self) {
		return;
	}
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	obj.describedObject = self;
    [_destinations insertObject:obj atIndex:index];
}

- (void)removeObjectFromDestinationsAtIndex:(NSUInteger)index {
	((GCProperty *)_destinations[index]).describedObject = nil;
    [_destinations removeObjectAtIndex:index];
}
	

- (void)setHeaderDate:(GCProperty *)obj
{
	if (_headerDate) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_headerDate = (id)obj;
}

- (GCHeaderDateAttribute *)headerDate
{
	return _headerDate;
}


- (void)setSubmitterReference:(GCProperty *)obj
{
	if (_submitterReference) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_submitterReference = (id)obj;
}

- (GCSubmitterReferenceRelationship *)submitterReference
{
	return _submitterReference;
}


- (NSMutableArray *)mutableSubmissionReferences {
    return [self mutableArrayValueForKey:@"submissionReferences"];
}

- (NSUInteger)countOfSubmissionReferences {
	return [_submissionReferences count];
}

- (id)objectInSubmissionReferencesAtIndex:(NSUInteger)index {
    return [_submissionReferences objectAtIndex:index];
}
 
- (void)insertObject:(GCProperty *)obj inSubmissionReferencesAtIndex:(NSUInteger)index {
	NSParameterAssert([obj isKindOfClass:[GCSubmissionReferenceRelationship class]]);
	if (obj.describedObject == self) {
		return;
	}
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	obj.describedObject = self;
    [_submissionReferences insertObject:obj atIndex:index];
}

- (void)removeObjectFromSubmissionReferencesAtIndex:(NSUInteger)index {
	((GCProperty *)_submissionReferences[index]).describedObject = nil;
    [_submissionReferences removeObjectAtIndex:index];
}
	

- (void)setFile:(GCProperty *)obj
{
	if (_file) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_file = (id)obj;
}

- (GCFileAttribute *)file
{
	return _file;
}


- (void)setCopyright:(GCProperty *)obj
{
	if (_copyright) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_copyright = (id)obj;
}

- (GCCopyrightAttribute *)copyright
{
	return _copyright;
}


- (void)setGedcom:(GCProperty *)obj
{
	if (_gedcom) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_gedcom = (id)obj;
}

- (GCGedcomAttribute *)gedcom
{
	return _gedcom;
}


- (void)setCharacterSet:(GCProperty *)obj
{
	if (_characterSet) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_characterSet = (id)obj;
}

- (GCCharacterSetAttribute *)characterSet
{
	return _characterSet;
}


- (void)setLanguage:(GCProperty *)obj
{
	if (_language) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_language = (id)obj;
}

- (GCLanguageAttribute *)language
{
	return _language;
}


- (void)setPlaceFormatSpecifier:(GCProperty *)obj
{
	if (_placeFormatSpecifier) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_placeFormatSpecifier = (id)obj;
}

- (GCPlaceFormatSpecifierAttribute *)placeFormatSpecifier
{
	return _placeFormatSpecifier;
}


- (void)setNoteEmbedded:(GCProperty *)obj
{
	if (_noteEmbedded) {
		obj.describedObject = nil;
	}
	
	if (obj.describedObject) {
		[obj.describedObject.mutableProperties removeObject:obj];
	}
	
	obj.describedObject = self;
	
	_noteEmbedded = (id)obj;
}

- (GCNoteEmbeddedAttribute *)noteEmbedded
{
	return _noteEmbedded;
}


@end

