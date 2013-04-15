/*
 This file was autogenerated by tags.py 
 */

#import "GCDateAttribute.h"

#import "GCObject_internal.h"
#import "GCEntity_internal.h"



@implementation GCDateAttribute {

}

// Methods:
/** Initializes and returns a date.

 
 @return A new date.
*/
+(GCDateAttribute *)date
{
	return [[self alloc] init];
}
/** Initializes and returns a date.

 @param value The value as a GCValue object.
 @return A new date.
*/
+(GCDateAttribute *)dateWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a date.

 @param value The value as an NSString.
 @return A new date.
*/
+(GCDateAttribute *)dateWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"date"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

