/*
 This file was autogenerated by tags.py 
 */

#import "GCLDSConfirmationStatusAttribute.h"

@implementation GCLDSConfirmationStatusAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a lDSConfirmationStatus.

 
 @return A new lDSConfirmationStatus.
*/
+(instancetype)lDSConfirmationStatus
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a lDSConfirmationStatus.

 @param value The value as a GCValue object.
 @return A new lDSConfirmationStatus.
*/
+(instancetype)lDSConfirmationStatusWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a lDSConfirmationStatus.

 @param value The value as an NSString.
 @return A new lDSConfirmationStatus.
*/
+(instancetype)lDSConfirmationStatusWithGedcomStringValue:(NSString *)value
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
