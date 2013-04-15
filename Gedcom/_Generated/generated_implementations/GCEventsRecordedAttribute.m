/*
 This file was autogenerated by tags.py 
 */

#import "GCEventsRecordedAttribute.h"

#import "GCObject_internal.h"
#import "GCContext_internal.h"

#import "GCDateAttribute.h"
#import "GCPlaceAttribute.h"

@implementation GCEventsRecordedAttribute {
	GCDateAttribute *_date;
	GCPlaceAttribute *_place;
}

// Methods:
/** Initializes and returns a eventsRecorded.

 
 @return A new eventsRecorded.
*/
+(GCEventsRecordedAttribute *)eventsRecorded
{
	return [[self alloc] init];
}
/** Initializes and returns a eventsRecorded.

 @param value The value as a GCValue object.
 @return A new eventsRecorded.
*/
+(GCEventsRecordedAttribute *)eventsRecordedWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a eventsRecorded.

 @param value The value as an NSString.
 @return A new eventsRecorded.
*/
+(GCEventsRecordedAttribute *)eventsRecordedWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"eventsRecorded"];
	
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
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCEventsRecordedAttribute *)[self.context.undoManager prepareWithInvocationTarget:self] setDate:_date];
	[self.context.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
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


- (void)setPlace:(id)obj
{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCEventsRecordedAttribute *)[self.context.undoManager prepareWithInvocationTarget:self] setPlace:_place];
	[self.context.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	if (_place) {
		[obj setValue:nil forKey:@"describedObject"];
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	_place = (id)obj;
}

- (GCPlaceAttribute *)place
{
	return _place;
}


@end

