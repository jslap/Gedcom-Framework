/*
 This file was autogenerated by tags.py 
 */

#import "GCDestinationAttribute.h"

#import "GCObject_internal.h"
#import "GCProperty_internal.h"



@implementation GCDestinationAttribute {

}

// Methods:
/** Initializes and returns a destination.

 
 @return A new destination.
*/
+(GCDestinationAttribute *)destination
{
	return [[self alloc] init];
}
/** Initializes and returns a destination.

 @param value The value as a GCValue object.
 @return A new destination.
*/
+(GCDestinationAttribute *)destinationWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a destination.

 @param value The value as an NSString.
 @return A new destination.
*/
+(GCDestinationAttribute *)destinationWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"destination"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

