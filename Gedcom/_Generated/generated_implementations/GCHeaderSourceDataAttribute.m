/*
 This file was autogenerated by tags.py 
 */

#import "GCHeaderSourceDataAttribute.h"

#import "GCObject_internal.h"

#import "GCCopyrightAttribute.h"
#import "GCDateAttribute.h"

@implementation GCHeaderSourceDataAttribute {
	GCDateAttribute *_date;
	GCCopyrightAttribute *_copyright;
}

// Methods:
/** Initializes and returns a headerSourceData.

 
 @return A new headerSourceData.
*/
+(GCHeaderSourceDataAttribute *)headerSourceData
{
	return [[self alloc] init];
}
/** Initializes and returns a headerSourceData.

 @param value The value as a GCValue object.
 @return A new headerSourceData.
*/
+(GCHeaderSourceDataAttribute *)headerSourceDataWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a headerSourceData.

 @param value The value as an NSString.
 @return A new headerSourceData.
*/
+(GCHeaderSourceDataAttribute *)headerSourceDataWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"headerSourceData"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:

- (void)setDate:(id)obj
{
	NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
	
	NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
	
	[(GCHeaderSourceDataAttribute *)[self.undoManager prepareWithInvocationTarget:self] setDate:_date];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, self.localizedType]];
	
	if (_date) {
		[obj setValue:nil forKey:@"describedObject"];
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	_date = (id)obj;
}

- (GCDateAttribute *)date
{
	return _date;
}


- (void)setCopyright:(id)obj
{
	NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
	
	NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
	
	[(GCHeaderSourceDataAttribute *)[self.undoManager prepareWithInvocationTarget:self] setCopyright:_copyright];
	[self.undoManager setActionName:[NSString stringWithFormat:formatString, self.localizedType]];
	
	if (_copyright) {
		[obj setValue:nil forKey:@"describedObject"];
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	_copyright = (id)obj;
}

- (GCCopyrightAttribute *)copyright
{
	return _copyright;
}


@end

