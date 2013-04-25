//
//  NSObject+MELazyPropertySwizzlingAdditions.m
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 24/04/13.
//  Copyright (c) 2013 Mikkel Eide Eriksen. All rights reserved.
//

#import "NSObject+MELazyPropertySwizzlingAdditions.h"
#import <objc/runtime.h>
#import <string.h>

@implementation NSObject (MELazyPropertySwizzlingAdditions)

+ (void)setupLazyProperties
{
    const size_t prefixLen = strlen(lazyPrefix);
    
    Class cls = [self class];
    
    int unsigned numMethods;
    Method *methods = class_copyMethodList(cls, &numMethods);
    for (int i = 0; i < numMethods; i++) {
        SEL lazySel = method_getName(methods[i]);
        const char *lazySelName = sel_getName(lazySel);
        
        if (strncmp(lazyPrefix, lazySelName, prefixLen) != 0) {
            continue;
        }
        
        //NSLog(@"%s", lazySelName);
        
        size_t tmpSize = (strlen(lazySelName)-prefixLen)+1;
        
        char *getterName = malloc(tmpSize * sizeof(char));
        strncpy(getterName, lazySelName+prefixLen, tmpSize);
        getterName[0] = getterName[0] + 32; // lowercase first char
        getterName[tmpSize] = '\0';
        
        char *ivarName = malloc((tmpSize+1) * sizeof(char));
        strncpy(ivarName+1, getterName, tmpSize);
        ivarName[0] = '_';
        ivarName[tmpSize+1] = '\0';
        
        tmpSize = strlen(lazySelName);
        char *tokenName = malloc((tmpSize+5) * sizeof(char));
        strncpy(tokenName, lazySelName, tmpSize);
        strncpy(tokenName+tmpSize, "Token", 5);
        tokenName[tmpSize+5] = '\0';
        
        SEL getterSel = sel_registerName(getterName);
        
        Ivar ivar = class_getInstanceVariable(cls, ivarName);
        Ivar tokenIvar = class_getInstanceVariable(cls, tokenName);
        
        Method lazyGetter = class_getInstanceMethod(cls, lazySel);
        Method origGetter = class_getInstanceMethod(cls, getterSel);
        
        IMP lazyIMP = method_getImplementation(lazyGetter);
        IMP origIMP = method_getImplementation(origGetter);
        
        IMP newIMP = imp_implementationWithBlock(^(id _s) {
            dispatch_once_t token = (dispatch_once_t)object_getIvar(_s, tokenIvar);
            
            dispatch_once(&token, ^{
                if (!object_getIvar(_s, ivar)) {
                    object_setIvar(_s, ivar, lazyIMP(_s, lazySel));
                }
            });
            
            return origIMP(_s, getterSel);
        });
        
        method_setImplementation(origGetter, newIMP);
    }
}

@end
