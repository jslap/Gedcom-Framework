/*
 This file was autogenerated by tags.py 
 */

#import "GCSurnameAttribute.h"



@implementation GCSurnameAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a surname.

 
 @return A new surname.
*/
+(instancetype)surname
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a surname.

 @param value The value as a GCValue object.
 @return A new surname.
*/
+(instancetype)surnameWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a surname.

 @param value The value as an NSString.
 @return A new surname.
*/
+(instancetype)surnameWithGedcomStringValue:(NSString *)value
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
