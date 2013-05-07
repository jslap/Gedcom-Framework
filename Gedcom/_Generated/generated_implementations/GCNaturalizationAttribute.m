/*
 This file was autogenerated by tags.py 
 */

#import "GCNaturalizationAttribute.h"

@implementation GCNaturalizationAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a naturalization.

 
 @return A new naturalization.
*/
+(instancetype)naturalization
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a naturalization.

 @param value The value as a GCValue object.
 @return A new naturalization.
*/
+(instancetype)naturalizationWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a naturalization.

 @param value The value as an NSString.
 @return A new naturalization.
*/
+(instancetype)naturalizationWithGedcomStringValue:(NSString *)value
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
