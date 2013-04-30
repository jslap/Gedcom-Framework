/*
 This file was autogenerated by tags.py 
 */

#import "GCAttribute.h"

@class GCTypeDescriptionAttribute;

/**
 
*/
@interface GCUserReferenceNumberAttribute : GCAttribute

// Methods:
/// @name Initializing

/** Initializes and returns a userReferenceNumber.

 
 @return A new userReferenceNumber.
*/
+(instancetype)userReferenceNumber;
/// @name Initializing

/** Initializes and returns a userReferenceNumber.

 @param value The value as a GCValue object.
 @return A new userReferenceNumber.
*/
+(instancetype)userReferenceNumberWithValue:(GCValue *)value;
/// @name Initializing

/** Initializes and returns a userReferenceNumber.

 @param value The value as an NSString.
 @return A new userReferenceNumber.
*/
+(instancetype)userReferenceNumberWithGedcomStringValue:(NSString *)value;

// Properties:
/// . 
@property (nonatomic) GCTypeDescriptionAttribute *typeDescription;


@end
