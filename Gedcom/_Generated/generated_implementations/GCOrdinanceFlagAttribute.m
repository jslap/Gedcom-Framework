/*
 This file was autogenerated by tags.py 
 */

#import "GCOrdinanceFlagAttribute.h"



@implementation GCOrdinanceFlagAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a ordinanceFlag.

 
 @return A new ordinanceFlag.
*/
+(instancetype)ordinanceFlag
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a ordinanceFlag.

 @param value The value as a GCValue object.
 @return A new ordinanceFlag.
*/
+(instancetype)ordinanceFlagWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a ordinanceFlag.

 @param value The value as an NSString.
 @return A new ordinanceFlag.
*/
+(instancetype)ordinanceFlagWithGedcomStringValue:(NSString *)value
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
