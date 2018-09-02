//
//  ClassB.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/9/2.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "ClassB.h"
#import "ClassA.h"

@implementation ClassB

- (void)test {
    NSLog(@"[self class] ---> %@ *** [super class] ---> %@",[self class],[super class]);
}

- (void)test2 {
    ClassA *classA = [[ClassA alloc] init];
    NSLog(@"[self class] ---> %@ *** [classA class] ---> %@", [self class], [classA class]);
}

- (void)test3 {
    NSLog(@"[self class] ---> %@ *** [super testtest] ---> %@", [self class], [super testtest]);
}

- (void)test4 {
    NSLog(@"[self class] ---> %@ *** [super testtest] ---> %@", [self class], [self testtest]);
}

@end
