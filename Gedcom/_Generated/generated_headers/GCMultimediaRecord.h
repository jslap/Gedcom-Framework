/*
 This file was autogenerated by tags.py 
 */

#import "GCRecord.h"

@class GCBinaryObjectAttribute;
@class GCChangeInfoAttribute;
@class GCMultimediaFormatAttribute;
@class GCNoteEmbeddedAttribute;
@class GCNoteReferenceRelationship;
@class GCRecordIdNumberAttribute;
@class GCTitleAttribute;
@class GCUserReferenceNumberAttribute;

/**
 
*/
@interface GCMultimediaRecord : GCRecord

// Methods:
/// @name Initializing

/** Initializes and returns a multimedia.

 @param context The context in which to create the entity.
 @return A new multimedia.
*/
+(instancetype)multimediaInContext:(GCContext *)context;

// Properties:
/// .  NB: required property.
@property (nonatomic) GCMultimediaFormatAttribute *multimediaFormat;

/// . 
@property (nonatomic) GCTitleAttribute *title;

/// @name Accessing notes

/// Property for accessing the following properties
@property (nonatomic) NSArray *notes;

/// @name Accessing notes 

///Also contained in notes. . GCNoteReferenceRelationship
@property (nonatomic) NSArray *noteReferences;
/// @name Accessing notes 

///Also contained in notes. . Contains instances of noteReferences
@property (nonatomic) NSMutableArray *mutableNoteReferences;

/// @name Accessing notes 

///Also contained in notes. . GCNoteEmbeddedAttribute
@property (nonatomic) NSArray *noteEmbeddeds;
/// @name Accessing notes 

///Also contained in notes. . Contains instances of noteEmbeddeds
@property (nonatomic) NSMutableArray *mutableNoteEmbeddeds;

/// . 
@property (nonatomic) GCBinaryObjectAttribute *binaryObject;

/// . GCUserReferenceNumberAttribute
@property (nonatomic) NSArray *userReferenceNumbers;
/// . Contains instances of userReferenceNumbers
@property (nonatomic) NSMutableArray *mutableUserReferenceNumbers;

/// . 
@property (nonatomic) GCRecordIdNumberAttribute *recordIdNumber;

/// . 
@property (nonatomic) GCChangeInfoAttribute *changeInfo;


@end
