/*
 This file was autogenerated by tags.py 
 */

#import "GCCremationAttribute.h"

@implementation GCCremationAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a cremation.

 
 @return A new cremation.
*/
+(instancetype)cremation
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a cremation.

 @param value The value as a GCValue object.
 @return A new cremation.
*/
+(instancetype)cremationWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a cremation.

 @param value The value as an NSString.
 @return A new cremation.
*/
+(instancetype)cremationWithGedcomStringValue:(NSString *)value
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
