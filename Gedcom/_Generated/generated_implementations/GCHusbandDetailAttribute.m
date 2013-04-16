/*
 This file was autogenerated by tags.py 
 */

#import "GCHusbandDetailAttribute.h"

#import "GCObject_internal.h"

#import "GCAgeAttribute.h"

@implementation GCHusbandDetailAttribute {
	GCAgeAttribute *_age;
}

// Methods:
/** Initializes and returns a husbandDetail.

 
 @return A new husbandDetail.
*/
+(GCHusbandDetailAttribute *)husbandDetail
{
	return [[self alloc] init];
}
/** Initializes and returns a husbandDetail.

 @param value The value as a GCValue object.
 @return A new husbandDetail.
*/
+(GCHusbandDetailAttribute *)husbandDetailWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a husbandDetail.

 @param value The value as an NSString.
 @return A new husbandDetail.
*/
+(GCHusbandDetailAttribute *)husbandDetailWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"husbandDetail"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:

- (void)setAge:(id)obj
{
	NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
	
	NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
	
	[(GCHusbandDetailAttribute *)[self.undoManager prepareWithInvocationTarget:self] setAge:_age];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, self.localizedType]];
	
	if (_age) {
		[obj setValue:nil forKey:@"describedObject"];
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	_age = (id)obj;
}

- (GCAgeAttribute *)age
{
	return _age;
}


@end

