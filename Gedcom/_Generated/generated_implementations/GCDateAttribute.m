/*
 This file was autogenerated by tags.py 
 */

#import "GCDateAttribute.h"

@implementation GCDateAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a date.

 
 @return A new date.
*/
+(instancetype)date
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a date.

 @param value The value as a GCValue object.
 @return A new date.
*/
+(instancetype)dateWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a date.

 @param value The value as an NSString.
 @return A new date.
*/
+(instancetype)dateWithGedcomStringValue:(NSString *)value
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
