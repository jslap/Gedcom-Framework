/*
 This file was autogenerated by tags.py 
 */

#import "GCWifeDetailAttribute.h"

#import "GCObject_internal.h"
#import "GCEntity_internal.h"

#import "GCAgeAttribute.h"

@implementation GCWifeDetailAttribute {
	GCAgeAttribute *_age;
}

// Methods:
/** Initializes and returns a wifeDetail.

 
 @return A new wifeDetail.
*/
+(GCWifeDetailAttribute *)wifeDetail
{
	return [[self alloc] init];
}
/** Initializes and returns a wifeDetail.

 @param value The value as a GCValue object.
 @return A new wifeDetail.
*/
+(GCWifeDetailAttribute *)wifeDetailWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a wifeDetail.

 @param value The value as an NSString.
 @return A new wifeDetail.
*/
+(GCWifeDetailAttribute *)wifeDetailWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"wifeDetail"];
	
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
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCWifeDetailAttribute *)[self.undoManager prepareWithInvocationTarget:self] setAge:_age];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
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

