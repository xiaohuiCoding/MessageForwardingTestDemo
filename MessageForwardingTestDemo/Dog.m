//
//  Dog.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)walkOn:(NSString *)road {
    NSLog(@"people walkOn %@",road);
}

- (void)eat {
    NSLog(@"eat some foods");
}

- (void)sing {
    NSLog(@"sing a song");
}

//- (void)sing:(BOOL)b {
//    if (b) {
//        NSLog(@"sing a song");
//    } else {
//        NSLog(@"sing a sound");
//    }
//}

@end
