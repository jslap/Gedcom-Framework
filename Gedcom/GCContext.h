//
//  GCXRefStore.h
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 28/03/12.
//  Copyright (c) 2012 Mikkel Eide Eriksen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GCNodeParserDelegate.h"
#import "GedcomTypedefs.h"

@class GCRecord;

@protocol GCContextDelegate;

/**
 
 A context encompasses a single file; all entities (that is, individuals, families, etc) in the file will belong to the same context. Generally you'll keep a reference to the context in your Document as it is needed when creating entities.
 
 ```
    // obtain a new context
    GCContext *ctx = [GCContext context];
    
    // optionally set your delegate
    ctx.delegate = ...;
 
    // read a file
    NSError *readErr = nil;
    BOOL readingSucceeded = [ctx readContentsOfFile:@"/path/to/file.ged" error:&readErr];
 
    if (!readingSucceeded) {
        // handle error
    }
    
    // work on context here: create/modify/delete entities & properties
    
    // save the context back out
    NSError *writeErr = nil;
    BOOL writingSucceeded = [ctx writeToFile:@"/path..." atomically:YES error:&writeErr];
     
     if (!writingSucceeded) {
         // handle error
     }
 ```
 
 */
@interface GCContext : NSObject <NSCoding, NSCopying>

#pragma mark Obtaining a context
/// @name Obtaining a context

/// Creates and returns a new context.
+ (instancetype)context;

/// Returns a dictionary containing all current contexts, keyed by name.
+ (NSDictionary *)contextsByName;

#pragma mark Parsing nodes
/// @name Parsing nodes

/** Causes the receiver to determine the encoding of the text contained in the data. It will then create a GCNodeParser, set itself as its delegate, and start the parser. As nodes come in from the parser, they are turned into entities, properties, etc.
 
 The determined encoding will be available on the fileEncoding property.
 
 Will throw an exception if the receiver already contains entities.
 
 @param data An NSData object containing a Gedcom string in any valid encoding.
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 @return `YES` if the parse was successful. If the receiver was unable to parse the nodes, it will return `NO` and set the error pointer to an NSError describing the problem.
 */
- (BOOL)parseData:(NSData *)data error:(NSError **)error;

/** Causes the receiver to parse the contents of the file into an NSData object and parse it using GCNodeParser.
  
 Will throw an exception if the receiver already contains entities.
 
 @param path A path to a Gedcom file.
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 @return `YES` if the parse was successful. If the receiver was unable to parse the nodes, it will return `NO` and set the error pointer to an NSError describing the problem.
 */
- (BOOL)readContentsOfFile:(NSString *)path error:(NSError **)error;

/** Causes the receiver to read the contents of the URL into an NSData object and pass it to parseData:error:.
 
 @param url A URL pointing to a Gedcom file.
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 @return `YES` if the parse was successful. If the receiver was unable to parse the nodes, it will return `NO` and set the error pointer to an NSError describing the problem.
 */
- (BOOL)readContentsOfURL:(NSURL *)url error:(NSError **)error;

#pragma mark Saving a context

/** Causes the receiver to write its contents to a file.
 
 @param path A path pointing to the inteded location.
 @param useAuxiliaryFile If `YES`, the contents are written to a backup file, and then—assuming no errors occur—the backup file is renamed to the name specified by path; otherwise, the data is written directly to path.
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 @return `YES` if the write was successful. If the receiver was unable to write its entities, it will return `NO` and set the error pointer to an NSError describing the problem.
 */
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile error:(NSError **)error;

#pragma mark Getting entities by URL

/** Causes the receiver to look up the entity referred to by the URL and return it.
 
 Attributed gedcom strings returned by GCObjects will contain URLs of the form "xref://contextName/xref".
 
 @param url An URL with the scheme `xref://`.
 @return The entity indicated by the URL.
 */
+ (GCRecord *)recordForURL:(NSURL *)url;

#pragma mark Merging contexts

/** Causes the receiver to merge another context into it.
 
 Warning: Not very thoroughly tested at the moment. May blow up in your face, so back up first and carefully check out the resulting context.
 
 It is recommended to use -addProperty:toRecordsOfType: on one or both of the contexts prior to merging in order to tell their records apart following the merge (for example to attach a note with the originating context).
 
 @param context The context with which to merge.
 @param error If an error occurs, upon return contains an NSError object that describes the problem. If you are not interested in possible errors, pass in NULL.
 @return `YES` for success, `NO` for failure. If `NO`, the error parameter will be populated and the context will need to be reloaded.
 */
- (BOOL)mergeContext:(GCContext *)context error:(NSError **)error;

#pragma mark - Objective-C properties -

#pragma mark Accessing properties
/// @name Accessing properties

/// The encoding of the file as specified in the header. Modifying this will alter the header. ANSEL is only supported when reading files, not when writing them.
@property GCFileEncoding fileEncoding;

/// The name of the receiver.
@property (readonly) NSString *name;

#pragma mark Setting the delegate
/// @name Setting the delegate

/// The receiver's delegate. See GCContextDelegate.
@property (weak) id<NSObject, GCContextDelegate> delegate;

@end