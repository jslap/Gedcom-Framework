/*
 This file was autogenerated by tags.py 
 */

#import "GCLegateeAttribute.h"

#import "GCObject_internal.h"



@implementation GCLegateeAttribute {

}

// Methods:
/** Initializes and returns a legatee.

 
 @return A new legatee.
*/
+(GCLegateeAttribute *)legatee
{
	return [[self alloc] init];
}
/** Initializes and returns a legatee.

 @param value The value as a GCValue object.
 @return A new legatee.
*/
+(GCLegateeAttribute *)legateeWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a legatee.

 @param value The value as an NSString.
 @return A new legatee.
*/
+(GCLegateeAttribute *)legateeWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"legatee"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

