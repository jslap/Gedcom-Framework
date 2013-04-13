/*
 This file was autogenerated by tags.py 
 */

#import "GCEntity.h"

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
@interface GCMultimediaEntity : GCEntity

// Methods:
/** Initializes and returns a multimedia.

 @param context The context in which to create the entity.
 @return A new multimedia.
*/
+(GCMultimediaEntity *)multimediaInContext:(GCContext *)context;

// Properties:
/// .  NB: required property.
@property (nonatomic) GCMultimediaFormatAttribute *multimediaFormat;

/// . 
@property (nonatomic) GCTitleAttribute *title;

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
@property (nonatomic) GCBinaryObjectAttribute *binaryObject;

/// . GCUserReferenceNumberAttribute
@property (nonatomic) NSArray *userReferenceNumbers;
/// . userReferenceNumbers
@property (nonatomic) NSMutableArray *mutableUserReferenceNumbers;

/// . 
@property (nonatomic) GCRecordIdNumberAttribute *recordIdNumber;

/// . 
@property (nonatomic) GCChangeInfoAttribute *changeInfo;


@end
