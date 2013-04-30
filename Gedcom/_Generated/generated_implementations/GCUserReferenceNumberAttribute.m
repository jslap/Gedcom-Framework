/*
 This file was autogenerated by tags.py 
 */

#import "GCUserReferenceNumberAttribute.h"

#import "GCTypeDescriptionAttribute.h"

@implementation GCUserReferenceNumberAttribute {
	GCTypeDescriptionAttribute *_typeDescription;
}

// Methods:
/// @name Initializing

/** Initializes and returns a userReferenceNumber.

 
 @return A new userReferenceNumber.
*/
+(instancetype)userReferenceNumber
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a userReferenceNumber.

 @param value The value as a GCValue object.
 @return A new userReferenceNumber.
*/
+(instancetype)userReferenceNumberWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a userReferenceNumber.

 @param value The value as an NSString.
 @return A new userReferenceNumber.
*/
+(instancetype)userReferenceNumberWithGedcomStringValue:(NSString *)value
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
@dynamic typeDescription;

@end
