//
//  GCNodeTests.m
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 11/18/10.
//  Copyright 2010 Mikkel Eide Eriksen. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "Gedcom.h"

@interface GCNodeTests : SenTestCase
@end


@implementation GCNodeTests

-(void)testGedString:(NSString *)gc_inputString countShouldBe:(NSUInteger) countShouldBe
{
	NSMutableArray *gc_inputLines = [NSMutableArray array];
    
    [gc_inputString enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
        [gc_inputLines addObject:line];
    }];
    
	NSArray *nodes = [GCNodeParser arrayOfNodesFromString:gc_inputString];
	NSMutableString *gc_outputString = [NSMutableString stringWithString:@""];
	NSMutableArray *gc_outputLines = [NSMutableArray arrayWithCapacity:[nodes count]];
	
	for (GCNode *node in nodes) {
		[gc_outputString appendString:node.gedcomString];
		[gc_outputLines addObjectsFromArray:node.gedcomLines];
	}
	
	STAssertEquals([gc_inputLines count], [gc_outputLines count], nil);
	STAssertNotNil(nodes, nil);
	STAssertNotNil(gc_inputString, nil);
	STAssertNotNil(gc_outputString, nil);
	STAssertEquals(countShouldBe, [nodes count], @"[nodes count] (%d) != %d", [nodes count], countShouldBe);
	
    int errorCount = 0;
	for (int i = 0; i < [gc_outputLines count]; i++) {
		STAssertEqualObjects([gc_inputLines objectAtIndex:i], [gc_outputLines objectAtIndex:i], nil);
        if (![[gc_inputLines objectAtIndex:i] isEqualTo:[gc_outputLines objectAtIndex:i]] && ++errorCount > 100) {
            break;
        }
	}
}

-(void)testFile:(NSString *)path countShouldBe:(NSUInteger) countShouldBe
{
	NSString *gc_inputString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	[self testGedString:gc_inputString countShouldBe:countShouldBe];
}

-(void)testCountSimpleRecords
{
	[self testGedString:@"0 @I1@ INDI\n1 NAME John /Johnson/\n" countShouldBe:1];
	[self testGedString:@"0 @N1@ NOTE\n1 CONC This is a test\n" countShouldBe:1];
}

-(void)testCountSimpleGed
{
	//from http://www.heiner-eichmann.de/gedcom/gedcom.htm
	NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"simple" ofType:@"ged"];
	STAssertNotNil(path, nil);
	[self testFile:path countShouldBe:7];
}

-(void)testCountAllGed
{
	//from http://www.heiner-eichmann.de/gedcom/gedcom.htm
	NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"allged" ofType:@"ged"];
	STAssertNotNil(path, nil);
	[self testFile:path countShouldBe:18];
}

- (void)testCountConcatenation
{
    NSString *gedcom = 
    @"0 @N1@ NOTE\n"
    @"1 CONC abc\n"
    @"1 CONT def\n"
    @"1 CONC ghi\n"
    @"1 CONT A very very long line that needs to be broken up because it is more than 248 characters long resulting in some CONC nodes underneath the current node. They should be assembled and disassembled losslessly by the GCNode code without need for program\n"
    @"1 CONC mer- or user-intervention."
    ;
	[self testGedString:gedcom countShouldBe:1];
}

- (void)testEquivalence
{
    GCNode *original = [[GCNodeParser arrayOfNodesFromString:
                         @"0 @INDI1@ INDI\n"
                         @"1 NAME Jens /Hansen/\n"
                         @"1 NAME Jens /Hansen/ Smed\n"
                         @"1 BIRT\n"
                         @"2 DATE 1 JAN 1901\n"
                         @"1 DEAT Y"] lastObject];
    
    GCNode *addition = [[GCNodeParser arrayOfNodesFromString:
                         @"0 @INDI1@ INDI\n"
                         @"1 NAME Jens /Hansen/\n"
                         @"1 NAME Jens /Hansen/ Smed\n"
                         @"1 BIRT\n"
                         @"2 DATE 1 JAN 1901\n"
                         @"1 CHR\n"
                         @"2 DATE 5 JAN 1901\n"
                         @"1 DEAT Y"] lastObject];
    
    STAssertEquals([original isEquivalentTo:addition], NO, nil);
    STAssertEquals([addition isEquivalentTo:original], NO, nil);
    
    GCNode *removal = [[GCNodeParser arrayOfNodesFromString:
                        @"0 @INDI1@ INDI\n"
                        @"1 NAME Jens /Hansen/\n"
                        @"1 BIRT\n"
                        @"2 DATE 1 JAN 1901\n"
                        @"1 DEAT Y"] lastObject];
    
    STAssertEquals([original isEquivalentTo:removal], NO, nil);
    STAssertEquals([removal isEquivalentTo:original], NO, nil);
    
    GCNode *reorder = [[GCNodeParser arrayOfNodesFromString:
                        @"0 @INDI1@ INDI\n"
                        @"1 NAME Jens /Hansen/ Smed\n"
                        @"1 NAME Jens /Hansen/\n"
                        @"1 BIRT\n"
                        @"2 DATE 1 JAN 1901\n"
                        @"1 DEAT Y"] lastObject];
    
    STAssertEquals([original isEquivalentTo:reorder], YES, nil);
    STAssertEquals([reorder isEquivalentTo:original], YES, nil);
    
}

@end
