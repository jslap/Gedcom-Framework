/*
 This file was autogenerated by tags.py 
 */

#import "GCPostalCodeAttribute.h"

#import "GCTagAccessAdditions.h"
#import "GCObject_internal.h"
#import "Gedcom_internal.h"

@implementation GCPostalCodeAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a postalCode.

 
 @return A new postalCode.
*/
+(instancetype)postalCode
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a postalCode.

 @param value The value as a GCValue object.
 @return A new postalCode.
*/
+(instancetype)postalCodeWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a postalCode.

 @param value The value as an NSString.
 @return A new postalCode.
*/
+(instancetype)postalCodeWithGedcomStringValue:(NSString *)value
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
