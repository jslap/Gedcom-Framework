/*
 This file was autogenerated by tags.py 
 */

#import "GCNationalityAttribute.h"

@implementation GCNationalityAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a nationality.

 
 @return A new nationality.
*/
+(instancetype)nationality
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a nationality.

 @param value The value as a GCValue object.
 @return A new nationality.
*/
+(instancetype)nationalityWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a nationality.

 @param value The value as an NSString.
 @return A new nationality.
*/
+(instancetype)nationalityWithGedcomStringValue:(NSString *)value
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
