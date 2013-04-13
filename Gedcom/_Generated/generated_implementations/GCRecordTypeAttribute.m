/*
 This file was autogenerated by tags.py 
 */

#import "GCRecordTypeAttribute.h"

#import "GCObject_internal.h"
#import "GCProperty_internal.h"



@implementation GCRecordTypeAttribute {

}

// Methods:
/** Initializes and returns a recordType.

 
 @return A new recordType.
*/
+(GCRecordTypeAttribute *)recordType
{
	return [[self alloc] init];
}
/** Initializes and returns a recordType.

 @param value The value as a GCValue object.
 @return A new recordType.
*/
+(GCRecordTypeAttribute *)recordTypeWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a recordType.

 @param value The value as an NSString.
 @return A new recordType.
*/
+(GCRecordTypeAttribute *)recordTypeWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"recordType"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

