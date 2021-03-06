/*
 This file was autogenerated by tags.py 
 */

#import "GCIndividualLDSOrdinanceAttribute.h"

@class GCLDSEndowmentStatusAttribute;

/**
 
*/
@interface GCLDSEndowmentAttribute : GCIndividualLDSOrdinanceAttribute

// Methods:
/// @name Initializing

/** Initializes and returns a lDSEndowment.

 
 @return A new lDSEndowment.
*/
+(instancetype)lDSEndowment;
/// @name Initializing

/** Initializes and returns a lDSEndowment.

 @param value The value as a GCValue object.
 @return A new lDSEndowment.
*/
+(instancetype)lDSEndowmentWithValue:(GCValue *)value;
/// @name Initializing

/** Initializes and returns a lDSEndowment.

 @param value The value as an NSString.
 @return A new lDSEndowment.
*/
+(instancetype)lDSEndowmentWithGedcomStringValue:(NSString *)value;

// Properties:
/// . 
@property (nonatomic) GCLDSEndowmentStatusAttribute *lDSEndowmentStatus;


@end
