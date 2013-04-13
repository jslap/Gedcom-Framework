/*
 This file was autogenerated by tags.py 
 */

#import "GCStateAttribute.h"

#import "GCObject_internal.h"
#import "GCProperty_internal.h"



@implementation GCStateAttribute {

}

// Methods:
/** Initializes and returns a state.

 
 @return A new state.
*/
+(GCStateAttribute *)state
{
	return [[self alloc] init];
}
/** Initializes and returns a state.

 @param value The value as a GCValue object.
 @return A new state.
*/
+(GCStateAttribute *)stateWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a state.

 @param value The value as an NSString.
 @return A new state.
*/
+(GCStateAttribute *)stateWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"state"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end
