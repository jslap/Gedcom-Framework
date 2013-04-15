/*
 This file was autogenerated by tags.py 
 */

#import "GCGedcomAttribute.h"

#import "GCObject_internal.h"
#import "GCContext_internal.h"

#import "GCGedcomFormatAttribute.h"
#import "GCVersionAttribute.h"

@implementation GCGedcomAttribute {
	GCVersionAttribute *_version;
	GCGedcomFormatAttribute *_gedcomFormat;
}

// Methods:
/** Initializes and returns a gedcom.

 
 @return A new gedcom.
*/
+(GCGedcomAttribute *)gedcom
{
	return [[self alloc] init];
}
/** Initializes and returns a gedcom.

 @param value The value as a GCValue object.
 @return A new gedcom.
*/
+(GCGedcomAttribute *)gedcomWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/** Initializes and returns a gedcom.

 @param value The value as an NSString.
 @return A new gedcom.
*/
+(GCGedcomAttribute *)gedcomWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (id)init
{
	self = [super _initWithType:@"gedcom"];
	
	if (self) {
		// initialize ivars, if any:

	}
	
	return self;
}


// Properties:

- (void)setVersion:(id)obj
{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCGedcomAttribute *)[self.context.undoManager prepareWithInvocationTarget:self] setVersion:_version];
	[self.context.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	if (_version) {
		[obj setValue:nil forKey:@"describedObject"];
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	_version = (id)obj;
}

- (GCVersionAttribute *)version
{
	return _version;
}


- (void)setGedcomFormat:(id)obj
{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    
    NSString *formatString = [frameworkBundle localizedStringForKey:@"Undo %@"
															  value:@"Undo %@"
															  table:@"Misc"];
    
    NSString *typeName = [frameworkBundle localizedStringForKey:self.type
															  value:self.type
															  table:@"Misc"];
    
	[(GCGedcomAttribute *)[self.context.undoManager prepareWithInvocationTarget:self] setGedcomFormat:_gedcomFormat];
	[self.context.undoManager setActionName:[NSString stringWithFormat:formatString, typeName]];
	
	if (_gedcomFormat) {
		[obj setValue:nil forKey:@"describedObject"];
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[((GCObject *)[obj valueForKey:@"describedObject"]).mutableProperties removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	_gedcomFormat = (id)obj;
}

- (GCGedcomFormatAttribute *)gedcomFormat
{
	return _gedcomFormat;
}


@end

