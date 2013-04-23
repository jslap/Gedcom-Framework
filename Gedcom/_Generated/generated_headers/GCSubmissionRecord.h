/*
 This file was autogenerated by tags.py 
 */

#import "GCRecord.h"

@class GCChangeInfoAttribute;
@class GCFamilyFileAttribute;
@class GCGenerationsOfAncestorsAttribute;
@class GCGenerationsOfDescendantsAttribute;
@class GCOrdinanceFlagAttribute;
@class GCRecordIdNumberAttribute;
@class GCSubmitterReferenceRelationship;
@class GCTempleAttribute;
@class GCUserReferenceNumberAttribute;

/**
 The sending system uses a submission record to send instructions and information to the receiving system.
*/
@interface GCSubmissionRecord : GCRecord

// Methods:
/** Initializes and returns a submission.

 @param context The context in which to create the entity.
 @return A new submission.
*/
+(instancetype)submissionInContext:(GCContext *)context;

// Properties:
/// . 
@property (nonatomic) GCSubmitterReferenceRelationship *submitterReference;

/// . 
@property (nonatomic) GCFamilyFileAttribute *familyFile;

/// . 
@property (nonatomic) GCTempleAttribute *temple;

/// . 
@property (nonatomic) GCGenerationsOfAncestorsAttribute *generationsOfAncestors;

/// . 
@property (nonatomic) GCGenerationsOfDescendantsAttribute *generationsOfDescendants;

/// . 
@property (nonatomic) GCOrdinanceFlagAttribute *ordinanceFlag;

/// . GCUserReferenceNumberAttribute
@property (nonatomic) NSArray *userReferenceNumbers;
/// . userReferenceNumbers
@property (nonatomic) NSMutableArray *mutableUserReferenceNumbers;

/// . 
@property (nonatomic) GCRecordIdNumberAttribute *recordIdNumber;

/// . 
@property (nonatomic) GCChangeInfoAttribute *changeInfo;


@end
