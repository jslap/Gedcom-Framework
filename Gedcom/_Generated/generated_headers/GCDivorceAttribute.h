/*
 This file was autogenerated by tags.py 
 */

#import "GCFamilyEventAttribute.h"

@class GCHusbandDetailAttribute;
@class GCWifeDetailAttribute;

/**
 
*/
@interface GCDivorceAttribute : GCFamilyEventAttribute

// Methods:
/// @name Initializing

/** Initializes and returns a divorce.

 
 @return A new divorce.
*/
+(instancetype)divorce;
/// @name Initializing

/** Initializes and returns a divorce.

 @param value The value as a GCValue object.
 @return A new divorce.
*/
+(instancetype)divorceWithValue:(GCValue *)value;
/// @name Initializing

/** Initializes and returns a divorce.

 @param value The value as an NSString.
 @return A new divorce.
*/
+(instancetype)divorceWithGedcomStringValue:(NSString *)value;

// Properties:
/// . 
@property (nonatomic) GCHusbandDetailAttribute *husbandDetail;

/// . 
@property (nonatomic) GCWifeDetailAttribute *wifeDetail;


@end
