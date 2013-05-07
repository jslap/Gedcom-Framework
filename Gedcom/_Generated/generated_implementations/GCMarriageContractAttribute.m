/*
 This file was autogenerated by tags.py 
 */

#import "GCMarriageContractAttribute.h"

@implementation GCMarriageContractAttribute {
	GCHusbandDetailAttribute *_husbandDetail;
	GCWifeDetailAttribute *_wifeDetail;
}

// Methods:
/// @name Initializing

/** Initializes and returns a marriageContract.

 
 @return A new marriageContract.
*/
+(instancetype)marriageContract
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a marriageContract.

 @param value The value as a GCValue object.
 @return A new marriageContract.
*/
+(instancetype)marriageContractWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a marriageContract.

 @param value The value as an NSString.
 @return A new marriageContract.
*/
+(instancetype)marriageContractWithGedcomStringValue:(NSString *)value
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
@dynamic husbandDetail;
@dynamic wifeDetail;

@end
