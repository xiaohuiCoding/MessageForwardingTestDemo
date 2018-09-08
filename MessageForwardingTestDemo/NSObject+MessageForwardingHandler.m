//
//  NSObject+MessageForwardingHandler.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/29.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "NSObject+MessageForwardingHandler.h"
#import <objc/runtime.h>

@implementation NSObject (MessageForwardingHandler)

int count;

//本类中的三行宏是用来消除在自定义的系统类的分类中重写系统方法所报的警告，也可以在 Build Settings/Other Warning Flags中添加"-Wno-objc-protocol-method-implementation"来消除警告

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (void)load {
    Method method1 = class_getInstanceMethod([self class], @selector(methodSignatureForSelector:));
    Method method2 = class_getInstanceMethod([self class], @selector(methodSignatureForSelectorNew:));
    method_exchangeImplementations(method1, method2);

    Method method3 = class_getInstanceMethod([self class], @selector(forwardInvocation:));
    Method method4 = class_getInstanceMethod([self class], @selector(forwardInvocationNew:));
    method_exchangeImplementations(method3, method4);

    Method method5 = class_getClassMethod([self class], @selector(methodSignatureForSelector:));
    Method method6 = class_getClassMethod([self class], @selector(methodSignatureForSelectorNew:));
    method_exchangeImplementations(method5, method6);

    Method method7 = class_getClassMethod([self class], @selector(forwardInvocation:));
    Method method8 = class_getClassMethod([self class], @selector(forwardInvocationNew:));
    method_exchangeImplementations(method7, method8);
}

- (void)dynamicMethodIMP {
    NSLog(@"消息转发成功，这是新消息！");
}

- (NSMethodSignature *)methodSignatureForSelectorNew:(SEL)aSelector {
    NSString *selectorString = NSStringFromSelector(aSelector);
    if (selectorString && selectorString.length > 0) {
        NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return methodSignature;
    } else {
        return nil;
    }
}

- (void)forwardInvocationNew:(NSInvocation *)anInvocation {
    NSLog(@"成功捕获到一个异常，该异常的诊断是 ---> 'reason: -[%@ %@]: unrecognized selector sent to instance %p' \n诊断结果来自方法 ---> '%s'",NSStringFromClass([self class]), NSStringFromSelector(anInvocation.selector), self, __func__);
    NSString *selectorString = NSStringFromSelector(anInvocation.selector);
    if (selectorString && selectorString.length > 0) {
        [self dynamicMethodIMP];
    }
}

+ (NSMethodSignature *)methodSignatureForSelectorNew:(SEL)aSelector {
    NSString *selectorString = NSStringFromSelector(aSelector);
    if (selectorString && selectorString.length > 0) {
        NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return methodSignature;
    } else {
        return nil;
    }
}

+ (void)forwardInvocationNew:(NSInvocation *)anInvocation {
    NSLog(@"成功捕获到一个异常，该异常的诊断是 ---> 'reason: +[%@ %@]: unrecognized selector sent to class %p' \n诊断结果来自方法 ---> '%s'",NSStringFromClass(self), NSStringFromSelector(anInvocation.selector), self, __func__);
    NSString *selectorString = NSStringFromSelector(anInvocation.selector);
    if (selectorString && selectorString.length > 0) {
        [self dynamicMethodIMP];
    }
}

#pragma clang diagnostic pop

@end
