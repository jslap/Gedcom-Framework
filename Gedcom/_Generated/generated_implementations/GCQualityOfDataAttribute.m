/*
 This file was autogenerated by tags.py 
 */

#import "GCQualityOfDataAttribute.h"

#import "GCObject_internal.h"
#import "GCEntity_internal.h"



@implementation GCQualityOfDataAttribute {

}

// Methods:
/** Initializes and returns a qualityOfData.

 
 @return A new qualityOfData.
*/
+(GCQualityOfDataAttribute *)qualityOfData
{
	return [[self alloc] init];
}
/** Initializes and returns a qualityOfData.

 @param value The value as a GCValue object.
 @return A new qualityOfData.
*/
+(GCQualityOfDataAttribute *)qualityOfDataWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a qualityOfData.

 @param value The value as an NSString.
 @return A new qualityOfData.
*/
+(GCQualityOfDataAttribute *)qualityOfDataWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"qualityOfData"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

