/*
 This file was autogenerated by tags.py 
 */

#import "GCRelationship.h"

@class GCNoteEmbeddedAttribute;
@class GCNoteReferenceRelationship;
@class GCRecordTypeAttribute;
@class GCRelationshipDescriptorAttribute;
@class GCSourceCitationRelationship;
@class GCSourceEmbeddedAttribute;

/**
 
*/
@interface GCAssociationRelationship : GCRelationship

// Methods:
/** Initializes and returns a association.

 
 @return A new association.
*/
+(GCAssociationRelationship *)association;

// Properties:
/// .  NB: required property.
@property (nonatomic) GCRecordTypeAttribute *recordType;

/// .  NB: required property.
@property (nonatomic) GCRelationshipDescriptorAttribute *relationshipDescriptor;

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

/// Property for accessing the following properties
@property (nonatomic) NSArray *sources;

/// Also contained in sources. . GCSourceCitationRelationship
@property (nonatomic) NSArray *sourceCitations;
/// Also contained in sources. . sourceCitations
@property (nonatomic) NSMutableArray *mutableSourceCitations;

/// Also contained in sources. . GCSourceEmbeddedAttribute
@property (nonatomic) NSArray *sourceEmbeddeds;
/// Also contained in sources. . sourceEmbeddeds
@property (nonatomic) NSMutableArray *mutableSourceEmbeddeds;


@end
