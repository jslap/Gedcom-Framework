/*
 This file was autogenerated by tags.py 
 */

#import "GCRestrictionNoticeAttribute.h"



@implementation GCRestrictionNoticeAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a restrictionNotice.

 
 @return A new restrictionNotice.
*/
+(instancetype)restrictionNotice
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a restrictionNotice.

 @param value The value as a GCValue object.
 @return A new restrictionNotice.
*/
+(instancetype)restrictionNoticeWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a restrictionNotice.

 @param value The value as an NSString.
 @return A new restrictionNotice.
*/
+(instancetype)restrictionNoticeWithGedcomStringValue:(NSString *)value
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
