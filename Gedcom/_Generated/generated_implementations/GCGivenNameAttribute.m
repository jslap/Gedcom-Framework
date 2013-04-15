/*
 This file was autogenerated by tags.py 
 */

#import "GCGivenNameAttribute.h"

#import "GCObject_internal.h"
#import "GCEntity_internal.h"



@implementation GCGivenNameAttribute {

}

// Methods:
/** Initializes and returns a givenName.

 
 @return A new givenName.
*/
+(GCGivenNameAttribute *)givenName
{
	return [[self alloc] init];
}
/** Initializes and returns a givenName.

 @param value The value as a GCValue object.
 @return A new givenName.
*/
+(GCGivenNameAttribute *)givenNameWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a givenName.

 @param value The value as an NSString.
 @return A new givenName.
*/
+(GCGivenNameAttribute *)givenNameWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"givenName"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

