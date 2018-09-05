//
//  Test.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/9/5.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Test.h"
#import <objc/runtime.h>

void testMetaClassImplementation(id self, SEL _cmd) {
    NSLog(@"This objcet is %p", self);
    NSLog(@"Class is %@, super class is %@", [self class], [self superclass]);
    Class currentClass = [self class];
    for (int i = 0; i < 5; i++) {
        NSLog(@"Following the isa pointer %d times gives %p", i, currentClass);
        currentClass = objc_getClass((__bridge void *)currentClass);
    }
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p", objc_getClass((__bridge void *)[NSObject class]));
}

@implementation Test

- (void)ex_registerClassPair {
    Class newClass = objc_allocateClassPair([NSError class], "NewError", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)testMetaClassImplementation, "v@:");
    objc_registerClassPair(newClass);
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
}

@end
