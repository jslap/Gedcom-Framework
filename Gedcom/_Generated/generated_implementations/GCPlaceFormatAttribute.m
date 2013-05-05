/*
 This file was autogenerated by tags.py 
 */

#import "GCPlaceFormatAttribute.h"

@implementation GCPlaceFormatAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a placeFormat.

 
 @return A new placeFormat.
*/
+(instancetype)placeFormat
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a placeFormat.

 @param value The value as a GCValue object.
 @return A new placeFormat.
*/
+(instancetype)placeFormatWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a placeFormat.

 @param value The value as an NSString.
 @return A new placeFormat.
*/
+(instancetype)placeFormatWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (instancetype)init
{
	self = [super init];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end
