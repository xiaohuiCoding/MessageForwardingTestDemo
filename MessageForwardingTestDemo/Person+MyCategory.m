//
//  Person+MyCategory.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/9/4.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Person+MyCategory.h"
#import <objc/runtime.h>

const void *kNameKey = &kNameKey;
//const char kNameKey;

@implementation Person (MyCategory)

#pragma mark - use runtime to add property for this class object

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, kNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    objc_setAssociatedObject(self, &kNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, kNameKey);
//    return objc_getAssociatedObject(self, &kNameKey);
//    return objc_getAssociatedObject(self, @selector(name));
//    return objc_getAssociatedObject(self, "name");
}

#pragma mark - directly to add instance method for this class

- (void)eatFood {
    NSLog(@"instance method 'eatFood' execute");
}

+ (void)eatFood {
    NSLog(@"class method 'eatFood' execute");
}

#pragma mark - use runtime to add property for this class

+ (void)setAssociatedObjc:(NSString *)associatedObjc {
    objc_setAssociatedObject(self, @selector(associatedObjc), associatedObjc, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (NSString *)associatedObjc {
    return objc_getAssociatedObject(self, @selector(associatedObjc));
}

@end
