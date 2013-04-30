/*
 This file was autogenerated by tags.py 
 */

#import "GCTempleAttribute.h"



@implementation GCTempleAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a temple.

 
 @return A new temple.
*/
+(instancetype)temple
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a temple.

 @param value The value as a GCValue object.
 @return A new temple.
*/
+(instancetype)templeWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a temple.

 @param value The value as an NSString.
 @return A new temple.
*/
+(instancetype)templeWithGedcomStringValue:(NSString *)value
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
