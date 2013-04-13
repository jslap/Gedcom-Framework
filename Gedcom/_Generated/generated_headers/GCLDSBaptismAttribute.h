/*
 This file was autogenerated by tags.py 
 */

#import "GCAttribute.h"

@class GCDateAttribute;
@class GCLDSBaptismStatusAttribute;
@class GCNoteEmbeddedAttribute;
@class GCNoteReferenceRelationship;
@class GCPlaceAttribute;
@class GCSourceCitationRelationship;
@class GCSourceEmbeddedAttribute;
@class GCTempleAttribute;

/**
 
*/
@interface GCLDSBaptismAttribute : GCAttribute

// Methods:
/** Initializes and returns a lDSBaptism.

 
 @return A new lDSBaptism.
*/
+(GCLDSBaptismAttribute *)lDSBaptism;
/** Initializes and returns a lDSBaptism.

 @param value The value as a GCValue object.
 @return A new lDSBaptism.
*/
+(GCLDSBaptismAttribute *)lDSBaptismWithValue:(GCValue *)value;
/** Initializes and returns a lDSBaptism.

 @param value The value as an NSString.
 @return A new lDSBaptism.
*/
+(GCLDSBaptismAttribute *)lDSBaptismWithGedcomStringValue:(NSString *)value;

// Properties:
/// . 
@property (nonatomic) GCLDSBaptismStatusAttribute *lDSBaptismStatus;

/// . 
@property (nonatomic) GCDateAttribute *date;

/// . 
@property (nonatomic) GCTempleAttribute *temple;

/// . 
@property (nonatomic) GCPlaceAttribute *place;

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

