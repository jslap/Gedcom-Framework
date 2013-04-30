/*
 This file was autogenerated by tags.py 
 */

#import "GCDestinationAttribute.h"



@implementation GCDestinationAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a destination.

 
 @return A new destination.
*/
+(instancetype)destination
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a destination.

 @param value The value as a GCValue object.
 @return A new destination.
*/
+(instancetype)destinationWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a destination.

 @param value The value as an NSString.
 @return A new destination.
*/
+(instancetype)destinationWithGedcomStringValue:(NSString *)value
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
