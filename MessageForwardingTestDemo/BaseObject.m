//
//  BaseObject.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/29.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "BaseObject.h"
#import <objc/runtime.h>

@interface BaseObject ()

@end

@implementation BaseObject

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"消息转发成功，这是新消息！");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {

    NSString *selString = NSStringFromSelector(sel);
    if (selString && selString.length > 0) {
        class_addMethod(self, sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    } else {
        return [super resolveInstanceMethod:sel];
    }
}

@end
