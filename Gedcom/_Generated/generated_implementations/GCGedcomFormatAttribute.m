/*
 This file was autogenerated by tags.py 
 */

#import "GCGedcomFormatAttribute.h"

#import "GCObject_internal.h"
#import "GCProperty_internal.h"



@implementation GCGedcomFormatAttribute {

}

// Methods:
/** Initializes and returns a gedcomFormat.

 
 @return A new gedcomFormat.
*/
+(GCGedcomFormatAttribute *)gedcomFormat
{
	return [[self alloc] init];
}
/** Initializes and returns a gedcomFormat.

 @param value The value as a GCValue object.
 @return A new gedcomFormat.
*/
+(GCGedcomFormatAttribute *)gedcomFormatWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a gedcomFormat.

 @param value The value as an NSString.
 @return A new gedcomFormat.
*/
+(GCGedcomFormatAttribute *)gedcomFormatWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"gedcomFormat"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

