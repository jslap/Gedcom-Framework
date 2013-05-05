/*
 This file was autogenerated by tags.py 
 */

#import "GCRelationshipDescriptorAttribute.h"

@implementation GCRelationshipDescriptorAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a relationshipDescriptor.

 
 @return A new relationshipDescriptor.
*/
+(instancetype)relationshipDescriptor
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a relationshipDescriptor.

 @param value The value as a GCValue object.
 @return A new relationshipDescriptor.
*/
+(instancetype)relationshipDescriptorWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a relationshipDescriptor.

 @param value The value as an NSString.
 @return A new relationshipDescriptor.
*/
+(instancetype)relationshipDescriptorWithGedcomStringValue:(NSString *)value
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
