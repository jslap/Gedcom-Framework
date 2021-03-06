/*
 This file was autogenerated by tags.py 
 */

#import "GCImmigrationAttribute.h"

#import "GCTagAccessAdditions.h"
#import "GCObject_internal.h"
#import "Gedcom_internal.h"

@implementation GCImmigrationAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a immigration.

 
 @return A new immigration.
*/
+(instancetype)immigration
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a immigration.

 @param value The value as a GCValue object.
 @return A new immigration.
*/
+(instancetype)immigrationWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a immigration.

 @param value The value as an NSString.
 @return A new immigration.
*/
+(instancetype)immigrationWithGedcomStringValue:(NSString *)value
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
