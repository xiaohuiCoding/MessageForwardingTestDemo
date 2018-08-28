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



void dynamicMethodIMPGrow(id self, SEL _cmd) {
    NSLog(@"生长");
}

void dynamicMethodIMPSwingWhen(id self, SEL _cmd, id a) {
    NSLog(@"摆动当%@的时候",a);
}

void dynamicMethodIMPLookLikeOrLike(id self, SEL _cmd, id a, id b) {
    NSLog(@"看起来像%@或%@",a,b);
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(grow)) {
        Class metaClass = objc_getMetaClass("Tree");
        class_addMethod(metaClass, sel, (IMP)dynamicMethodIMPGrow, "v@:");
        return YES;
    } else if (sel == @selector(swingWhen:)) {
        Class metaClass = objc_getMetaClass("Tree");
        class_addMethod(metaClass, sel, (IMP)dynamicMethodIMPSwingWhen, "v@:");
        return YES;
    } else if (sel == @selector(lookLike:orLike:)) {
        Class metaClass = objc_getMetaClass("Tree");
        class_addMethod(metaClass, sel, (IMP)dynamicMethodIMPLookLikeOrLike, "v@:");
        return YES;
    } else {
        return [super resolveClassMethod:sel];
    }
}



//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(becomeTall)) {
//        return self.flower;
//    } else if (aSelector == @selector(absorbNutrientsFrom:)) {
//        return self.flower;
//    } else if (aSelector == @selector(dieOn:when:)) {
//        return self.flower;
//    } else {
//        return [super forwardingTargetForSelector:aSelector];
//    }
//}



//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if (aSelector == @selector(becomeTall)) {
//        return [[Flower class] methodSignatureForSelector:@selector(becomeTall)];
//    }
////    else if (aSelector == @selector(danceIn:)) {
////        return [self.dog methodSignatureForSelector:@selector(danceIn:)];
////    } else if (aSelector == @selector(offDutyFrom:when:)) {
////        return [self.dog methodSignatureForSelector:@selector(offDutyFrom:when:)];
////    }
//    else {
//        return [super methodSignatureForSelector:aSelector];
//    }
//}
//
////设置目标对象
////设置方法
////设置参数
////有两种处理方式：1.手动转发消息(invokeWithTarget) 或 2.抛出异常(doesNotRecognizeSelector)
////这种消息转发的优势是：1.可以屏蔽外界传入的参数内容，只在内部给参数赋值 2.可以自定义参数，增加或减少原函数的参数个数
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    if (anInvocation.selector == @selector(becomeTall)) {
//        [anInvocation setTarget:[Flower class]];
//        [anInvocation setSelector:@selector(becomeTall)];
//        [anInvocation invokeWithTarget:[Flower class]];
//        //        [anInvocation doesNotRecognizeSelector:@selector(sing)];
//    }
//    else if (anInvocation.selector == @selector(danceIn:)) {
//        [anInvocation setTarget:self.dog];
//        [anInvocation setSelector:@selector(danceIn:)];
//        NSString *arg = @"剧院";
//        [anInvocation setArgument:&arg atIndex:2];
//        [anInvocation retainArguments];
//        [anInvocation invokeWithTarget:self.dog];
//    } else if (anInvocation.selector == @selector(offDutyFrom:when:)) {
//        [anInvocation setTarget:self.dog];
//        [anInvocation setSelector:@selector(offDutyFrom:when:)];
//        NSString *arg1 = @"工厂";
//        NSString *arg2 = @"晚上八点";
//        [anInvocation setArgument:&arg1 atIndex:2];
//        [anInvocation setArgument:&arg2 atIndex:3];
//        [anInvocation retainArguments];
//        [anInvocation invokeWithTarget:self.dog];
//    } else {
//        [super forwardInvocation:anInvocation];
//    }
//}

@end
