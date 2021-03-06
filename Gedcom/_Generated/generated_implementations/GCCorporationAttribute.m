/*
 This file was autogenerated by tags.py 
 */

#import "GCCorporationAttribute.h"

#import "GCTagAccessAdditions.h"
#import "GCObject_internal.h"
#import "Gedcom_internal.h"

@implementation GCCorporationAttribute {
	GCAddressAttribute *_address;
	NSMutableArray *_phoneNumbers;
}

// Methods:
/// @name Initializing

/** Initializes and returns a corporation.

 
 @return A new corporation.
*/
+(instancetype)corporation
{
	return [[self alloc] init];
}
/// @name Initializing

/** Initializes and returns a corporation.

 @param value The value as a GCValue object.
 @return A new corporation.
*/
+(instancetype)corporationWithValue:(GCValue *)value
{
	return [[self alloc] initWithValue:value];
}
/// @name Initializing

/** Initializes and returns a corporation.

 @param value The value as an NSString.
 @return A new corporation.
*/
+(instancetype)corporationWithGedcomStringValue:(NSString *)value
{
	return [[self alloc] initWithGedcomStringValue:value];
}
- (instancetype)init
{
	self = [super init];
	
	if (self) {
		// initialize ivars, if any:
		_phoneNumbers = [NSMutableArray array];
	}
	
	return self;
}


// Properties:

- (id)address
{
	return _address;
}
	
- (void)setAddress:(id)obj
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCCorporationAttribute *)[uM prepareWithInvocationTarget:self] setAddress:_address];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if (_address) {
		[(id)_address setValue:nil forKey:@"describedObject"];
	}
	
	[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	
	[obj setValue:self forKey:@"describedObject"];
	
	_address = obj;
}

@synthesize phoneNumbers = _phoneNumbers;

@dynamic mutablePhoneNumbers;
- (NSMutableArray *)mutablePhoneNumbers
{
	return [self mutableArrayValueForKey:@"phoneNumbers"];
}

- (id)objectInPhoneNumbersAtIndex:(NSUInteger)idx
{
	return [_phoneNumbers objectAtIndex:idx];
}

- (NSUInteger)countOfPhoneNumbers
{
	return [_phoneNumbers count];
}

- (void)insertObject:(id)obj inPhoneNumbersAtIndex:(NSUInteger)idx
{
	if ([obj valueForKey:@"describedObject"] == self) {
		return;
	}
	
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCCorporationAttribute *)[uM prepareWithInvocationTarget:self] removeObjectFromPhoneNumbersAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	if ([obj valueForKey:@"describedObject"]) {
		[[obj valueForKeyPath:@"describedObject.mutableProperties"] removeObject:obj];
	}
	
	[obj setValue:self forKey:@"describedObject"];
	
	[_phoneNumbers insertObject:obj atIndex:idx];
}

- (void)removeObjectFromPhoneNumbersAtIndex:(NSUInteger)idx
{
	if (!_isBuildingFromGedcom) {
		NSUndoManager *uM = [self valueForKey:@"undoManager"];
		@synchronized (uM) {
			[uM beginUndoGrouping];
			[(GCCorporationAttribute *)[uM prepareWithInvocationTarget:self] insertObject:_phoneNumbers[idx] inPhoneNumbersAtIndex:idx];
			[uM setActionName:[NSString stringWithFormat:GCLocalizedString(@"Undo %@", @"Misc"), self.localizedType]];
			[uM endUndoGrouping];
		}
	}
	
	[_phoneNumbers[idx] setValue:nil forKey:@"describedObject"];
	
	[_phoneNumbers removeObjectAtIndex:idx];
}


@end
