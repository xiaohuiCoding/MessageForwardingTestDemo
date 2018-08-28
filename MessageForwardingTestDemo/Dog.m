//
//  Dog.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)drink {
    NSLog(@"喝水");
}

- (void)playIn:(NSString *)place {
    NSLog(@"在%@里玩耍",place);
}

- (void)wakeUpFrom:(NSString *)place when:(NSString *)time {
    NSLog(@"从%@上醒来当%@来临的时候",place,time);
}

- (void)sing {
    NSLog(@"唱歌");
}

- (void)danceIn:(NSString *)place {
    NSLog(@"在%@跳舞",place);
}

- (void)offDutyFrom:(NSString *)place when:(NSString *)time {
    NSLog(@"从%@下班当%@的时候",place,time);
}

@end
