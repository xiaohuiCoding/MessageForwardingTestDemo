//
//  Tree.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/28.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Tree.h"
#import <objc/runtime.h>
#import "Flower.h"

@interface Tree()

@property (nonatomic, strong) Flower *flower;

@end

@implementation Tree

//- (id)init {
//    if (self = [super init]) {
//        _flower = [[Flower alloc] init];
//    }
//    return self;
//}
//
//
//
//void dynamicMethodIMPGrow(id self, SEL _cmd) {
//    NSLog(@"生长");
//}
//
//void dynamicMethodIMPSwingWhen(id self, SEL _cmd, id a) {
//    NSLog(@"摆动当%@的时候",a);
//}
//
//void dynamicMethodIMPLookLikeOrLike(id self, SEL _cmd, id a, id b) {
//    NSLog(@"看起来像%@或%@",a,b);
//}
//
//+ (BOOL)resolveClassMethod:(SEL)sel {
//    if (sel == @selector(grow)) {
//        Class metaClass = objc_getMetaClass("Tree");
////        Class metaClass = [self superclass];
//        class_addMethod(metaClass, sel, (IMP)dynamicMethodIMPGrow, "v@:");
//        return YES;
//    } else if (sel == @selector(swingWhen:)) {
//        Class metaClass = objc_getMetaClass("Tree");
//        class_addMethod(metaClass, sel, (IMP)dynamicMethodIMPSwingWhen, "v@:");
//        return YES;
//    } else if (sel == @selector(lookLike:orLike:)) {
//        Class metaClass = objc_getMetaClass("Tree");
//        class_addMethod(metaClass, sel, (IMP)dynamicMethodIMPLookLikeOrLike, "v@:");
//        return YES;
//    } else {
//        return [super resolveClassMethod:sel];
//    }
//}
//
//
//
////将消息转发给某个指定的对象
//+ (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(becomeTall)) {
//        return [Flower class];
//    } else {
//        return [super forwardingTargetForSelector:aSelector];
//    }
//}
//
//
//
////设置目标对象
////设置方法
////设置参数
////这里有两种处理方式：1.手动转发消息(invokeWithTarget) 或 2.抛出异常(doesNotRecognizeSelector)
////这种消息转发的方式比-forwardingTargetForSelector:有优势，较灵活：1.可以将不同的消息转发给不同的对象 2.可以屏蔽外界传入的参数值，只在内部给参数传值 3.可以增加或减少原对象函数的参数
//
//+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if (aSelector == @selector(becomeThick)) {
//        return [[Flower class] methodSignatureForSelector:@selector(becomeThick)];
//    } else {
//        return [super methodSignatureForSelector:aSelector];
//    }
//}
//
//+ (void)forwardInvocation:(NSInvocation *)anInvocation {
//    if (anInvocation.selector == @selector(becomeThick)) {
//        [anInvocation setTarget:[Flower class]];
//        [anInvocation setSelector:@selector(becomeThick)];
//        [anInvocation invokeWithTarget:[Flower class]];
////        [anInvocation doesNotRecognizeSelector:@selector(becomeThick)];
//    } else {
//        [super forwardInvocation:anInvocation];
//    }
//}

@end
