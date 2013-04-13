/*
 This file was autogenerated by tags.py 
 */

#import "GCEntity.h"

@class GCAbbreviationAttribute;
@class GCAuthorAttribute;
@class GCChangeInfoAttribute;
@class GCMultimediaEmbeddedAttribute;
@class GCMultimediaReferenceRelationship;
@class GCNoteEmbeddedAttribute;
@class GCNoteReferenceRelationship;
@class GCPublicationFactsAttribute;
@class GCRecordIdNumberAttribute;
@class GCRepositoryCitationRelationship;
@class GCSourceDataAttribute;
@class GCTextAttribute;
@class GCTitleAttribute;
@class GCUserReferenceNumberAttribute;

/**
 Source records are used to provide a bibliographic description of the source cited.
*/
@interface GCSourceEntity : GCEntity

// Methods:
/** Initializes and returns a source.

 @param context The context in which to create the entity.
 @return A new source.
*/
+(GCSourceEntity *)sourceInContext:(GCContext *)context;

// Properties:
/// . 
@property (nonatomic) GCSourceDataAttribute *sourceData;

/// . 
@property (nonatomic) GCAuthorAttribute *author;

/// . 
@property (nonatomic) GCTitleAttribute *title;

/// . 
@property (nonatomic) GCAbbreviationAttribute *abbreviation;

/// . 
@property (nonatomic) GCPublicationFactsAttribute *publicationFacts;

/// . 
@property (nonatomic) GCTextAttribute *text;

/// . 
@property (nonatomic) GCRepositoryCitationRelationship *repositoryCitation;

/// Property for accessing the following properties
@property (nonatomic) NSArray *multimedias;

/// Also contained in multimedias. . GCMultimediaReferenceRelationship
@property (nonatomic) NSArray *multimediaReferences;
/// Also contained in multimedias. . multimediaReferences
@property (nonatomic) NSMutableArray *mutableMultimediaReferences;

/// Also contained in multimedias. . GCMultimediaEmbeddedAttribute
@property (nonatomic) NSArray *multimediaEmbeddeds;
/// Also contained in multimedias. . multimediaEmbeddeds
@property (nonatomic) NSMutableArray *mutableMultimediaEmbeddeds;

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

/// . 
@property (nonatomic) GCUserReferenceNumberAttribute *userReferenceNumber;

/// . 
@property (nonatomic) GCRecordIdNumberAttribute *recordIdNumber;

/// . 
@property (nonatomic) GCChangeInfoAttribute *changeInfo;


@end

