/*
 This file was autogenerated by tags.py 
 */

#import "GCEntity_internal.h"

@class GCAnnulmentAttribute;
@class GCCensusAttribute;
@class GCChangeInfoAttribute;
@class GCChildRelationship;
@class GCDivorceAttribute;
@class GCDivorceFiledAttribute;
@class GCEngagementAttribute;
@class GCGenericEventAttribute;
@class GCHusbandRelationship;
@class GCLDSSealingSpouseAttribute;
@class GCMarriageAttribute;
@class GCMarriageBannAttribute;
@class GCMarriageContractAttribute;
@class GCMarriageLicenseAttribute;
@class GCMarriageSettlementAttribute;
@class GCMultimediaEmbeddedAttribute;
@class GCMultimediaReferenceRelationship;
@class GCNoteEmbeddedAttribute;
@class GCNoteReferenceRelationship;
@class GCNumberOfChildrenAttribute;
@class GCRecordIdNumberAttribute;
@class GCSourceCitationRelationship;
@class GCSourceEmbeddedAttribute;
@class GCSubmitterReferenceRelationship;
@class GCUserReferenceNumberAttribute;
@class GCWifeRelationship;

/**
 The family record is used to record marriages, common law marriages, and family unions caused by two people becoming the parents of a child.
*/
@interface GCFamilyEntity : GCEntity

// Methods:
/** Initializes and returns a family.

 @param context The context in which to create the entity.
 @return A new family.
*/
+(GCFamilyEntity *)familyInContext:(GCContext *)context;

// Properties:
/// Property for accessing the following properties
@property (nonatomic) NSArray *familyEvents;

/// Also contained in familyEvents. . GCAnnulmentAttribute
@property (nonatomic) NSArray *annulments;
/// Also contained in familyEvents. . annulments
@property (nonatomic) NSMutableArray *mutableAnnulments;

/// Also contained in familyEvents. . GCCensusAttribute
@property (nonatomic) NSArray *censuses;
/// Also contained in familyEvents. . censuses
@property (nonatomic) NSMutableArray *mutableCensuses;

/// Also contained in familyEvents. . GCDivorceAttribute
@property (nonatomic) NSArray *divorces;
/// Also contained in familyEvents. . divorces
@property (nonatomic) NSMutableArray *mutableDivorces;

/// Also contained in familyEvents. . GCDivorceFiledAttribute
@property (nonatomic) NSArray *divorceFileds;
/// Also contained in familyEvents. . divorceFileds
@property (nonatomic) NSMutableArray *mutableDivorceFileds;

/// Also contained in familyEvents. . GCEngagementAttribute
@property (nonatomic) NSArray *engagements;
/// Also contained in familyEvents. . engagements
@property (nonatomic) NSMutableArray *mutableEngagements;

/// Also contained in familyEvents. . GCMarriageAttribute
@property (nonatomic) NSArray *marriages;
/// Also contained in familyEvents. . marriages
@property (nonatomic) NSMutableArray *mutableMarriages;

/// Also contained in familyEvents. . GCMarriageBannAttribute
@property (nonatomic) NSArray *marriageBanns;
/// Also contained in familyEvents. . marriageBanns
@property (nonatomic) NSMutableArray *mutableMarriageBanns;

/// Also contained in familyEvents. . GCMarriageContractAttribute
@property (nonatomic) NSArray *marriageContracts;
/// Also contained in familyEvents. . marriageContracts
@property (nonatomic) NSMutableArray *mutableMarriageContracts;

/// Also contained in familyEvents. . GCMarriageLicenseAttribute
@property (nonatomic) NSArray *marriageLicenses;
/// Also contained in familyEvents. . marriageLicenses
@property (nonatomic) NSMutableArray *mutableMarriageLicenses;

/// Also contained in familyEvents. . GCMarriageSettlementAttribute
@property (nonatomic) NSArray *marriageSettlements;
/// Also contained in familyEvents. . marriageSettlements
@property (nonatomic) NSMutableArray *mutableMarriageSettlements;

/// Also contained in familyEvents. . GCGenericEventAttribute
@property (nonatomic) NSArray *genericEvents;
/// Also contained in familyEvents. . genericEvents
@property (nonatomic) NSMutableArray *mutableGenericEvents;

/// . 
@property (nonatomic) GCHusbandRelationship *husband;

/// . 
@property (nonatomic) GCWifeRelationship *wife;

/// . GCChildRelationship
@property (nonatomic) NSArray *children;
/// . children
@property (nonatomic) NSMutableArray *mutableChildren;

/// . 
@property (nonatomic) GCNumberOfChildrenAttribute *numberOfChildren;

/// . GCSubmitterReferenceRelationship
@property (nonatomic) NSArray *submitterReferences;
/// . submitterReferences
@property (nonatomic) NSMutableArray *mutableSubmitterReferences;

/// . GCLDSSealingSpouseAttribute
@property (nonatomic) NSArray *lDSSealingSpouses;
/// . lDSSealingSpouses
@property (nonatomic) NSMutableArray *mutableLDSSealingSpouses;

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

/// . GCUserReferenceNumberAttribute
@property (nonatomic) NSArray *userReferenceNumbers;
/// . userReferenceNumbers
@property (nonatomic) NSMutableArray *mutableUserReferenceNumbers;

/// . 
@property (nonatomic) GCRecordIdNumberAttribute *recordIdNumber;

/// . 
@property (nonatomic) GCChangeInfoAttribute *changeInfo;


@end

