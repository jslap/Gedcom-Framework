/*
 This file was autogenerated by tags.py 
 */

#import "GCRelationship.h"

@class GCNoteEmbeddedAttribute;
@class GCNoteReferenceRelationship;

/**
 
*/
@interface GCSpouseInFamilyRelationship : GCRelationship

// Methods:
/** Initializes and returns a spouseInFamily.

 
 @return A new spouseInFamily.
*/
+(GCSpouseInFamilyRelationship *)spouseInFamily;

// Properties:
/// Property for accessing the following properties
@property (nonatomic) NSArray *notes;

/// Also contained in notes. . GCNoteReferenceRelationship
@property (nonatomic) NSArray *noteReferences;
/// Also contained in notes. . noteReferences
@property (nonatomic) NSMutableArray *mutableNoteReferences;

/// Also contained in notes. . GCNoteEmbeddedAttribute
@property (nonatomic) NSArray *noteEmbeddeds;
/// Also contained in notes. . noteEmbeddeds
@property (nonatomic) NSMutableArray *mutableNoteEmbeddeds;


@end

