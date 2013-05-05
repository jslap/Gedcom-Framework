/*
 This file was autogenerated by tags.py 
 */

#import "GCStateAttribute.h"

@implementation GCStateAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a state.

 
 @return A new state.
*/
+(instancetype)state
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a state.

 @param value The value as a GCValue object.
 @return A new state.
*/
+(instancetype)stateWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a state.

 @param value The value as an NSString.
 @return A new state.
*/
+(instancetype)stateWithGedcomStringValue:(NSString *)value
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
