//
//  People.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>
#import "Dog.h"
#import "Computer.h"
#import <UIKit/UIKit.h>
#import "NSObject+ViewController.h"

@interface People() <UIAlertViewDelegate>

@property (nonatomic, strong) Dog *dog;
@property (nonatomic, strong) Computer *computer;

@end

@implementation People

- (id)init {
    if (self = [super init]) {
        _dog = [[Dog alloc] init];
        _computer = [[Computer alloc] init];
    }
    return self;
}



void dynamicMethodIMPEat(id self, SEL _cmd) {
    NSLog(@"吃饭");
}

void dynamicMethodIMPWorkIn(id self, SEL _cmd, id a) {
    NSLog(@"在%@里工作",a);
}

void dynamicMethodIMPSleepOnWhen(id self, SEL _cmd, id a, id b) {
    NSLog(@"在%@上睡觉当%@来临的时候",a,b);
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//
//    NSString *selString = NSStringFromSelector(sel);
////    __weak People *weakSelf = self;
//    if (selString && selString.length > 0 && ![selString isEqualToString:@"crashHaHaHa"]) {
////        class_addMethod(self, sel, (IMP)dynamicMethodIMPEat, "v@:");
//        class_addMethod([self class], sel, imp_implementationWithBlock(^(id self, SEL _cmd){
////            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"程序闪退警告" delegate:self cancelButtonTitle:@"任其闪退" otherButtonTitles:@"回首页", nil];
////            [alert show];
//
////            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
////                People *p = [[People alloc] init];
////                [p crashHaHaHa];
////            }];
//
//        }), "v@:");
//        return YES;
//    } else {
//        return nil;
//    }
//
////    if (sel == @selector(eat)) {
////        class_addMethod(self, sel, (IMP)dynamicMethodIMPEat, "v@:");
////        class_addMethod(self, sel, imp_implementationWithBlock(^(id self, SEL _cmd){
////            NSLog(@"吃饭");
////        }), "v@:");
////        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"注释信息,没有就写nil" preferredStyle:UIAlertControllerStyleAlert];
////
////        //可以给alertview中添加一个输入框
////        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
////            textField.placeholder = @"alert中的文本";
////        }];
////
////        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"标题1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
////            NSLog(@"点击了按钮1，进入按钮1的事件");
////            //textFields是一个数组，获取所输入的字符串
////            NSLog(@"%@",alert.textFields.lastObject.text);
////        }];
////        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
////            NSLog(@"点击了取消");
////        }];
////
////        [alert addAction:action1];
////        [alert addAction:action2];
////
////        [[self getTopViewController] presentViewController:alert animated:YES completion:nil];
//
////        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"123" message:@"123" delegate:[self getTopViewController] cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
////        [alert show];
////        return YES;
////    }
//// if (sel == @selector(workIn:)) {
//////        class_addMethod(self, sel, (IMP)dynamicMethodIMPWorkIn, "v@:");
////        class_addMethod(self, sel, imp_implementationWithBlock(^(id self, id a){
////            NSLog(@"在%@里工作",a);
////        }), "v@:");
////        return YES;
////    } else if (sel == @selector(sleepOn:when:)) {
//////        class_addMethod(self, sel, (IMP)dynamicMethodIMPSleepOnWhen, "v@:");
////        class_addMethod(self, sel, imp_implementationWithBlock(^(id self, id a, id b){
////            NSLog(@"在%@上睡觉当%@来临的时候",a,b);
////        }), "v@:");
////        return YES;
////    }
////    else {
////        return [super resolveInstanceMethod:sel];
////    }
//}



//将消息转发给某个指定的对象
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSString *s = NSStringFromSelector(aSelector);
//    if (s.length > 0) {
//        return self.dog;
//    }
////    if (aSelector == @selector(eat)) {
////        self.isOK = NO;
////        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"123" message:@"123" delegate:[self getTopViewController] cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
////        [alert show];
////        return [self ss];
////    }
////    if (aSelector == @selector(drink)) {
////        return self.dog;
////    } else if (aSelector == @selector(playIn:)) {
////        return self.dog;
////    } else if (aSelector == @selector(wakeUpFrom:when:)) {
////        return self.dog;
////    }
//    else {
//        return [super forwardingTargetForSelector:aSelector];
//    }
//}



//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if (aSelector == @selector(sing)) {
//        return [self.dog methodSignatureForSelector:@selector(sing)];
//    } else if (aSelector == @selector(danceIn:)) {
//        return [self.dog methodSignatureForSelector:@selector(danceIn:)];
//    } else if (aSelector == @selector(offDutyFrom:when:)) {
//        return [self.dog methodSignatureForSelector:@selector(offDutyFrom:when:)];
//    } else if (aSelector == @selector(run)) {
//        return [self.computer methodSignatureForSelector:@selector(run)];
//    } else if (aSelector == @selector(jump)) {
//        return [self.computer methodSignatureForSelector:@selector(jump:)];
//    } else if (aSelector == @selector(walk:)) {
//        return [self.computer methodSignatureForSelector:@selector(walk)];
//    } else {
//        return [super methodSignatureForSelector:aSelector];
//    }
//}
//
////设置目标对象
////设置方法
////设置参数
////这里有两种处理方式：1.手动转发消息(invokeWithTarget) 或 2.抛出异常(doesNotRecognizeSelector)
////这种消息转发的方式比-forwardingTargetForSelector:有优势，较灵活：1.可以将不同的消息转发给不同的对象 2.可以屏蔽外界传入的参数值，只在内部给参数传值 3.可以增加或减少原对象函数的参数
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    if (anInvocation.selector == @selector(sing)) {
//        [anInvocation setTarget:self.dog];
//        [anInvocation setSelector:@selector(sing)];
//        [anInvocation invokeWithTarget:self.dog];
////        [anInvocation doesNotRecognizeSelector:@selector(sing)];
//    } else if (anInvocation.selector == @selector(danceIn:)) {
//        [anInvocation setTarget:self.dog];
//        [anInvocation setSelector:@selector(danceIn:)];
//        NSString *arg = @"剧院";
//        [anInvocation setArgument:&arg atIndex:2];
//        [anInvocation retainArguments];
//        [anInvocation invokeWithTarget:self.dog];
//    } else if (anInvocation.selector == @selector(offDutyFrom:when:)) {
//        [anInvocation setTarget:self.dog];
//        [anInvocation setSelector:@selector(offDutyFrom:when:)];
//        NSString *arg1 = @"工厂";//屏蔽外界传入的参数值
//        NSString *arg2 = @"晚上八点";
//        [anInvocation setArgument:&arg1 atIndex:2];
//        [anInvocation setArgument:&arg2 atIndex:3];
//        [anInvocation retainArguments];
//        [anInvocation invokeWithTarget:self.dog];
//    } else if (anInvocation.selector == @selector(run)) {
//        [anInvocation setTarget:self.computer];
//        [anInvocation setSelector:@selector(run)];
//        [anInvocation invokeWithTarget:self.computer];
//    } else if (anInvocation.selector == @selector(jump)) {
//        [anInvocation setTarget:self.computer];
//        [anInvocation setSelector:@selector(jump:)];
//        NSInteger arg = 10;//增加参数
//        [anInvocation setArgument:&arg atIndex:2];
//        [anInvocation retainArguments];
//        [anInvocation invokeWithTarget:self.computer];
//    } else if (anInvocation.selector == @selector(walk:)) {
//        [anInvocation setTarget:self.computer];
//        [anInvocation setSelector:@selector(walk)];
//        [anInvocation invokeWithTarget:self.computer];
//    } else {
//        [super forwardInvocation:anInvocation];
//    }
//}

@end
