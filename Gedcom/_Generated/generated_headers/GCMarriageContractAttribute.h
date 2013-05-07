/*
 This file was autogenerated by tags.py 
 */

#import "GCFamilyEventAttribute.h"

@class GCHusbandDetailAttribute;
@class GCWifeDetailAttribute;

/**
 
*/
@interface GCMarriageContractAttribute : GCFamilyEventAttribute

// Methods:
/// @name Initializing

/** Initializes and returns a marriageContract.

 
 @return A new marriageContract.
*/
+(instancetype)marriageContract;
/// @name Initializing

/** Initializes and returns a marriageContract.

 @param value The value as a GCValue object.
 @return A new marriageContract.
*/
+(instancetype)marriageContractWithValue:(GCValue *)value;
/// @name Initializing

/** Initializes and returns a marriageContract.

 @param value The value as an NSString.
 @return A new marriageContract.
*/
+(instancetype)marriageContractWithGedcomStringValue:(NSString *)value;

// Properties:
/// . 
@property (nonatomic) GCHusbandDetailAttribute *husbandDetail;

/// . 
@property (nonatomic) GCWifeDetailAttribute *wifeDetail;


@end
