/*
 This file was autogenerated by tags.py 
 */

#import "GCAttribute.h"

@class GCGedcomFormatAttribute;
@class GCVersionAttribute;

/**
 
*/
@interface GCGedcomAttribute : GCAttribute

// Methods:
/// @name Initializing

/** Initializes and returns a gedcom.

 
 @return A new gedcom.
*/
+(instancetype)gedcom;
/// @name Initializing

/** Initializes and returns a gedcom.

 @param value The value as a GCValue object.
 @return A new gedcom.
*/
+(instancetype)gedcomWithValue:(GCValue *)value;
/// @name Initializing

/** Initializes and returns a gedcom.

 @param value The value as an NSString.
 @return A new gedcom.
*/
+(instancetype)gedcomWithGedcomStringValue:(NSString *)value;

// Properties:
/// .  NB: required property.
@property (nonatomic) GCVersionAttribute *version;

/// .  NB: required property.
@property (nonatomic) GCGedcomFormatAttribute *gedcomFormat;


@end
