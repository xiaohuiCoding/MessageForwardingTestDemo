//
//  NSObject+MessageForwardingHandler.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/29.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "NSObject+MessageForwardingHandler.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "People.h"
#import "CustomIOSAlertView.h"

@implementation NSObject (MessageForwardingHandler)

//三行宏是用来消除因为在系统类的分类中重写系统方法所报的警告，也可以在 Build Settings/Other Warning Flags中添加"-Wno-objc-protocol-method-implementation"来消除警告

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"test");
    dispatch_async(dispatch_get_main_queue(), ^{
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 240)];
        customView.backgroundColor = [UIColor redColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 240, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"程序出现异常，您可选择";
        [customView addSubview:label];
        [alertView setContainerView:customView];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"关闭程序", @"暂时忽略", nil]];
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            if (buttonIndex == 0) {
                People *p = [[People alloc] init];
                [p crashHaHaHa];
            }
            [alertView close];
        }];
        [alertView show];
    });
}



//+ (BOOL)resolveInstanceMethodNew:(SEL)sel {
//
//    BOOL result = [self resolveInstanceMethodNew:sel];
//
//    if (!result) {
//        NSLog(@"NOT RECOGNIZED: %@", NSStringFromSelector(sel));
//    }
//
//    return result;
////    NSString *selString = NSStringFromSelector(sel);
////    if (selString && selString.length > 0 && ![selString isEqualToString:@"crashHaHaHa"]) {
////        class_addMethod(self, sel, (IMP)dynamicMethodIMP, "v@:");
////        return YES;
////    } else {
////        return NO;
////    }
//}



////- (id)forwardingTargetForSelector:(SEL)aSelector {
////
////}



+ (void)load {
    Method method1 = class_getInstanceMethod([self class], @selector(methodSignatureForSelector:));
    Method method2 = class_getInstanceMethod([self class], @selector(methodSignatureForSelectorNew:));
    method_exchangeImplementations(method1, method2);

    Method method3 = class_getInstanceMethod([self class], @selector(forwardInvocation:));
    Method method4 = class_getInstanceMethod([self class], @selector(forwardInvocationNew:));
    method_exchangeImplementations(method3, method4);
}

- (NSMethodSignature *)methodSignatureForSelectorNew:(SEL)aSelector {
    
    if (![self respondsToSelector:aSelector]) {
        
        NSMethodSignature *methodSignature = [self methodSignatureForSelectorNew:aSelector];
        NSString *selString = NSStringFromSelector(aSelector);
        
        if (selString && selString.length > 0 && ![selString isEqualToString:@"crashHaHaHa"]) {
            
            if (class_addMethod([self class], aSelector, (IMP)dynamicMethodIMP, "v@:")) {
                NSLog(@"动态添加方法成功！");
            }
            if (!methodSignature) {
                NSLog(@"*** %@ - %@ *** unrecognized selector %s",NSStringFromClass([self class]),NSStringFromSelector(aSelector),__func__);
                
                methodSignature = [self methodSignatureForSelectorNew:aSelector];
            }
            return methodSignature;
            
        } else {
            return nil;
        }
        
    } else {
        return [self methodSignatureForSelectorNew:aSelector];
    }
}

- (void)forwardInvocationNew:(NSInvocation *)anInvocation {
    if ([self respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self];
    } else {
        [self forwardInvocationNew:anInvocation];
    }
}

#pragma clang diagnostic pop

@end
