/*
 This file was autogenerated by tags.py 
 */

#import "GCHeaderDateAttribute.h"

#import "GCObject_internal.h"

#import "GCTimeAttribute.h"

@implementation GCHeaderDateAttribute {
	GCTimeAttribute *_time;
}

// Methods:
/** Initializes and returns a headerDate.

 
 @return A new headerDate.
*/
+(GCHeaderDateAttribute *)headerDate
{
	return [[self alloc] init];
}
/** Initializes and returns a headerDate.

 @param value The value as a GCValue object.
 @return A new headerDate.
*/
+(GCHeaderDateAttribute *)headerDateWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a headerDate.

 @param value The value as an NSString.
 @return A new headerDate.
*/
+(GCHeaderDateAttribute *)headerDateWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"headerDate"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:

- (void)setTime:(id)obj
{
	NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
	
	NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
	
	[(GCHeaderDateAttribute *)[self.undoManager prepareWithInvocationTarget:self] setTime:_time];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, self.localizedType]];
	
	if (_time) {
		[obj setValue:nil forKey:@"describedObject"];
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	_time = (id)obj;
}

- (GCTimeAttribute *)time
{
	return _time;
}


@end

