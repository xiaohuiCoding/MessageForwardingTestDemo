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

@interface People()

@property (nonatomic, strong) Dog *dog;

@end

@implementation People

- (id)init{
    
    self = [super init];
    if (self) {
        _dog = [[Dog alloc] init];
    }
    
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(walkOn:)) {
        class_addMethod(self, sel, (IMP)dynamicMethodIMPWalkOn, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//动态添加的@selector(walkOn:) 对应的实现
void dynamicMethodIMPWalkOn(id self, SEL _cmd,id road) {
    NSLog(@"人步行在%@上",road);
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(eat)) {
        return self.dog;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(sing)) {
        return [self.dog methodSignatureForSelector:@selector(sing)];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == @selector(sing)) {
        [anInvocation setTarget:self.dog];//设置目标对象
        [anInvocation setSelector:@selector(sing)];//设置方法
//        BOOL arg = YES;
//        [anInvocation setArgument:&arg atIndex:2];//设置参数
//        [anInvocation retainArguments];
        //有两种处理方式：手动转发或抛异常
        [anInvocation invokeWithTarget:self.dog];//手动转发消息
//        [anInvocation doesNotRecognizeSelector:@selector(sing)];//抛出异常
    } else {
        [super forwardInvocation:anInvocation];
    }
}

@end
