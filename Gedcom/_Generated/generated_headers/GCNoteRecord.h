/*
 This file was autogenerated by tags.py 
 */

#import "GCRecord.h"

@class GCChangeInfoAttribute;
@class GCRecordIdNumberAttribute;
@class GCSourceCitationRelationship;
@class GCSourceEmbeddedAttribute;
@class GCUserReferenceNumberAttribute;

/**
 
*/
@interface GCNoteRecord : GCRecord

// Methods:
/// @name Initializing

/** Initializes and returns a note.

 @param context The context in which to create the entity.
 @return A new note.
*/
+(instancetype)noteInContext:(GCContext *)context;

// Properties:
/// @name Accessing sources

/// Property for accessing the following properties
@property (nonatomic) NSArray *sources;

/// @name Accessing sources 

///Also contained in sources. . GCSourceCitationRelationship
@property (nonatomic) NSArray *sourceCitations;
/// @name Accessing sources 

///Also contained in sources. . Contains instances of sourceCitations
@property (nonatomic) NSMutableArray *mutableSourceCitations;

/// @name Accessing sources 

///Also contained in sources. . GCSourceEmbeddedAttribute
@property (nonatomic) NSArray *sourceEmbeddeds;
/// @name Accessing sources 

///Also contained in sources. . Contains instances of sourceEmbeddeds
@property (nonatomic) NSMutableArray *mutableSourceEmbeddeds;

/// . GCUserReferenceNumberAttribute
@property (nonatomic) NSArray *userReferenceNumbers;
/// . Contains instances of userReferenceNumbers
@property (nonatomic) NSMutableArray *mutableUserReferenceNumbers;

/// . 
@property (nonatomic) GCRecordIdNumberAttribute *recordIdNumber;

/// . 
@property (nonatomic) GCChangeInfoAttribute *changeInfo;


@end
