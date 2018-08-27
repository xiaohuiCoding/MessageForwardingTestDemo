//
//  UIScrollView+MethodForwarding.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "UIScrollView+MethodForwarding.h"
#import "NSObject+ViewController.h"

@implementation UIScrollView (MethodForwarding)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(setContentInsetAdjustmentBehavior:)) {
        return [UIViewController instanceMethodSignatureForSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    UIViewController *topViewController = [self getTopViewController];
    NSInvocation *viewControllerInvocation = [NSInvocation invocationWithMethodSignature:anInvocation.methodSignature];
    [viewControllerInvocation setTarget:topViewController];
    [viewControllerInvocation setSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)];
    BOOL automaticallyAdjustsScrollViewInsets = NO;
    [viewControllerInvocation setArgument:&automaticallyAdjustsScrollViewInsets atIndex:2];
    [viewControllerInvocation invokeWithTarget:topViewController];
}

@end
