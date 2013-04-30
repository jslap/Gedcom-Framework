/*
 This file was autogenerated by tags.py 
 */

#import "GCPublicationFactsAttribute.h"



@implementation GCPublicationFactsAttribute {

}

// Methods:
/// @name Initializing

/** Initializes and returns a publicationFacts.

 
 @return A new publicationFacts.
*/
+(instancetype)publicationFacts
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a publicationFacts.

 @param value The value as a GCValue object.
 @return A new publicationFacts.
*/
+(instancetype)publicationFactsWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a publicationFacts.

 @param value The value as an NSString.
 @return A new publicationFacts.
*/
+(instancetype)publicationFactsWithGedcomStringValue:(NSString *)value
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
