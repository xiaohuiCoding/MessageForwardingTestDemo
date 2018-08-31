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

- (id)init {
    if (self = [super init]) {
        _flower = [[Flower alloc] init];
    }
    return self;
}



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
////        Class metaClass = objc_getMetaClass("Tree");
//        Class metaClass = [self superclass];
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



//将消息转发给某个指定的对象
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(becomeTall)) {
//        return nil;
//    } else {
//        return [super forwardingTargetForSelector:aSelector];
//    }
//}



//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    return nil;
//}
//
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//
//}

@end
