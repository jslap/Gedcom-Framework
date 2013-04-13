/*
 This file was autogenerated by tags.py 
 */

#import "GCRecordIdNumberAttribute.h"

#import "GCObject_internal.h"
#import "GCProperty_internal.h"



@implementation GCRecordIdNumberAttribute {

}

// Methods:
/** Initializes and returns a recordIdNumber.

 
 @return A new recordIdNumber.
*/
+(GCRecordIdNumberAttribute *)recordIdNumber
{
	return [[self alloc] init];
}
/** Initializes and returns a recordIdNumber.

 @param value The value as a GCValue object.
 @return A new recordIdNumber.
*/
+(GCRecordIdNumberAttribute *)recordIdNumberWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a recordIdNumber.

 @param value The value as an NSString.
 @return A new recordIdNumber.
*/
+(GCRecordIdNumberAttribute *)recordIdNumberWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"recordIdNumber"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

