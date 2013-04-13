/*
 This file was autogenerated by tags.py 
 */

#import "GCGenerationsOfAncestorsAttribute.h"

#import "GCObject_internal.h"
#import "GCProperty_internal.h"



@implementation GCGenerationsOfAncestorsAttribute {

}

// Methods:
/** Initializes and returns a generationsOfAncestors.

 
 @return A new generationsOfAncestors.
*/
+(GCGenerationsOfAncestorsAttribute *)generationsOfAncestors
{
	return [[self alloc] init];
}
/** Initializes and returns a generationsOfAncestors.

 @param value The value as a GCValue object.
 @return A new generationsOfAncestors.
*/
+(GCGenerationsOfAncestorsAttribute *)generationsOfAncestorsWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a generationsOfAncestors.

 @param value The value as an NSString.
 @return A new generationsOfAncestors.
*/
+(GCGenerationsOfAncestorsAttribute *)generationsOfAncestorsWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"generationsOfAncestors"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:


@end

