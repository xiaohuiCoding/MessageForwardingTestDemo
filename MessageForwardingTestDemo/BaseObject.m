//
//  BaseObject.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/29.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "BaseObject.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "People.h"
#import "CustomIOSAlertView.h"

@interface BaseObject ()

@end

@implementation BaseObject

//void dynamicMethodIMP(id self, SEL _cmd) {
//
//    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 240)];
//    customView.backgroundColor = [UIColor redColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 240, 30)];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"程序出现异常，您可选择";
//    [customView addSubview:label];
//    [alertView setContainerView:customView];
//    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"关闭程序", @"暂时忽略", nil]];
//    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
//        if (buttonIndex == 0) {
//            People *p = [[People alloc] init];
//            [p crashHaHaHa];
//        }
//    }];
//    [alertView show];
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//
//    NSString *selString = NSStringFromSelector(sel);
//    if (selString && selString.length > 0 && ![selString isEqualToString:@"crashHaHaHa"]) {
//        class_addMethod(self, sel, (IMP)dynamicMethodIMP, "v@:");
//        return YES;
//    } else {
//        return [super resolveInstanceMethod:sel];
//    }
//}

@end
