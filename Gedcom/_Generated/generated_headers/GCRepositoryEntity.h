/*
 This file was autogenerated by tags.py 
 */

#import "GCEntity.h"

@class GCAddressAttribute;
@class GCChangeInfoAttribute;
@class GCDescriptiveNameAttribute;
@class GCNoteEmbeddedAttribute;
@class GCNoteReferenceRelationship;
@class GCPhoneNumberAttribute;
@class GCRecordIdNumberAttribute;
@class GCUserReferenceNumberAttribute;

/**
 
*/
@interface GCRepositoryEntity : GCEntity

// Methods:
/** Initializes and returns a repository.

 @param context The context in which to create the entity.
 @return A new repository.
*/
+(GCRepositoryEntity *)repositoryInContext:(GCContext *)context;

// Properties:
/// . 
@property (nonatomic) GCDescriptiveNameAttribute *descriptiveName;

/// . 
@property (nonatomic) GCAddressAttribute *address;

/// . GCPhoneNumberAttribute
@property (nonatomic) NSArray *phoneNumbers;
/// . phoneNumbers
@property (nonatomic) NSMutableArray *mutablePhoneNumbers;

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

/// . GCUserReferenceNumberAttribute
@property (nonatomic) NSArray *userReferenceNumbers;
/// . userReferenceNumbers
@property (nonatomic) NSMutableArray *mutableUserReferenceNumbers;

/// . 
@property (nonatomic) GCRecordIdNumberAttribute *recordIdNumber;

/// . 
@property (nonatomic) GCChangeInfoAttribute *changeInfo;


@end

