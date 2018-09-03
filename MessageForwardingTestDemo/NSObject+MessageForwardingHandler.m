////
////  NSObject+MessageForwardingHandler.m
////  MessageForwardingTestDemo
////
////  Created by xiaohui on 2018/8/29.
////  Copyright © 2018年 XIAOHUI. All rights reserved.
////
//
//#import "NSObject+MessageForwardingHandler.h"
//#import <objc/runtime.h>
//#import <UIKit/UIKit.h>
//#import "People.h"
//#import "CustomIOSAlertView.h"
//
//@implementation NSObject (MessageForwardingHandler)
//
//int count;
//
////本类中的三行宏是用来消除在自定义的系统类的分类中重写系统方法所报的警告，也可以在 Build Settings/Other Warning Flags中添加"-Wno-objc-protocol-method-implementation"来消除警告
//
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
//
//+ (void)load {
//    Method method1 = class_getInstanceMethod([self class], @selector(methodSignatureForSelector:));
//    Method method2 = class_getInstanceMethod([self class], @selector(methodSignatureForSelectorNew:));
//    method_exchangeImplementations(method1, method2);
//
//    Method method3 = class_getInstanceMethod([self class], @selector(forwardInvocation:));
//    Method method4 = class_getInstanceMethod([self class], @selector(forwardInvocationNew:));
//    method_exchangeImplementations(method3, method4);
//
//    Method method5 = class_getClassMethod([self class], @selector(methodSignatureForSelector:));
//    Method method6 = class_getClassMethod([self class], @selector(methodSignatureForSelectorNew:));
//    method_exchangeImplementations(method5, method6);
//
//    Method method7 = class_getClassMethod([self class], @selector(forwardInvocation:));
//    Method method8 = class_getClassMethod([self class], @selector(forwardInvocationNew:));
//    method_exchangeImplementations(method7, method8);
//}
//
//void dynamicMethodIMP(id self, SEL _cmd) {
//    count = 1;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
//        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 240)];
//        customView.backgroundColor = [UIColor redColor];
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 240, 30)];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.text = [NSString stringWithFormat:@"程序出现了%d个异常，您可选择",count];
//        [customView addSubview:label];
//        [alertView setContainerView:customView];
//        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"关闭程序", @"暂时忽略", nil]];
//        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
//            if (buttonIndex == 0) {
//                People *p = [[People alloc] init];
//                [p crashHaHaHa];
//            }
//            [alertView close];
//        }];
//        [alertView show];
//        ++ count;
//    });
//}
//
//- (NSMethodSignature *)methodSignatureForSelectorNew:(SEL)aSelector {
//
//    if (![self respondsToSelector:aSelector]) {
//
//        NSMethodSignature *methodSignature = [self methodSignatureForSelectorNew:aSelector];
//        NSString *selString = NSStringFromSelector(aSelector);
//
//        //过滤一个特定的方法名，是为了可以故意发送假消息使关闭程序，仅仅是为了做一个用户操作而已，无他。
//        if (selString && selString.length > 0 && ![selString isEqualToString:@"crashHaHaHa"]) {
//
//            BOOL result = class_addMethod([self class], aSelector, (IMP)dynamicMethodIMP, "v@:");
//            if (result) {
//                NSLog(@"动态添加方法成功！");
//            }
//
//            if (!methodSignature) {
//                NSLog(@"成功捕获到一个异常，该异常的诊断是 ---> 'reason: -[%@ %@]: unrecognized selector sent to instance %p' \n诊断结果来自方法 ---> '%s'",NSStringFromClass([self class]), NSStringFromSelector(aSelector), self, __func__);
//
//                methodSignature = [self methodSignatureForSelectorNew:aSelector];
//                NSLog(@"动态添加的方法的返回值类型是 ---> %@",[NSString stringWithUTF8String:methodSignature.methodReturnType]);
//            }
//            return methodSignature;
//
//        } else {
//            return [self methodSignatureForSelectorNew:aSelector];
//        }
//
//    } else {
//        return [self methodSignatureForSelectorNew:aSelector];
//    }
//}
//
//- (void)forwardInvocationNew:(NSInvocation *)anInvocation {
//    if ([self respondsToSelector:anInvocation.selector]) {
//        [anInvocation invokeWithTarget:self];
//    } else {
//        [self forwardInvocationNew:anInvocation];
//    }
//}
//
//+ (NSMethodSignature *)methodSignatureForSelectorNew:(SEL)aSelector {
//
//    if (![self respondsToSelector:aSelector]) {
//
//        NSMethodSignature *methodSignature = [self methodSignatureForSelectorNew:aSelector];
//        NSString *selString = NSStringFromSelector(aSelector);
//
//        //过滤一个特定的方法名，是为了可以故意发送假消息使关闭程序，仅仅是为了做一个用户操作而已，无他。
//        if (selString && selString.length > 0 && ![selString isEqualToString:@"crashHaHaHa"]) {
//
//            Class metaClass = [self superclass];
//            BOOL result = class_addMethod(metaClass, aSelector, (IMP)dynamicMethodIMP, "v@:");
//            if (result) {
//                NSLog(@"动态添加方法成功！");
//            }
//
//            if (!methodSignature) {
//                NSLog(@"成功捕获到一个异常，该异常的诊断是 ---> 'reason: +[%@ %@]: unrecognized selector sent to class %p' \n诊断结果来自方法 ---> '%s'",NSStringFromClass(self), NSStringFromSelector(aSelector), self, __func__);
//
//                methodSignature = [self methodSignatureForSelectorNew:aSelector];
//
//                NSLog(@"动态添加的方法的返回值类型是 ---> %@",[NSString stringWithUTF8String:methodSignature.methodReturnType]);
//            }
//            return methodSignature;
//
//        } else {
//            return [self methodSignatureForSelectorNew:aSelector];
//        }
//
//    } else {
//        return [self methodSignatureForSelectorNew:aSelector];
//    }
//}
//
//+ (void)forwardInvocationNew:(NSInvocation *)anInvocation {
//    if ([self respondsToSelector:anInvocation.selector]) {
//        [anInvocation invokeWithTarget:self];
//    } else {
//        [self forwardInvocationNew:anInvocation];
//    }
//}
//
//#pragma clang diagnostic pop
//
//@end

