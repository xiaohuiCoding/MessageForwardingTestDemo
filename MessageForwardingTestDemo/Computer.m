//
//  Computer.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/28.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Computer.h"

@implementation Computer

- (void)run {
    NSLog(@"跑步");
}

- (void)jump:(NSInteger)distance {
    NSLog(@"跳了%ld米远",distance);
}

- (void)walk {
    NSLog(@"走了米远");
}

@end
