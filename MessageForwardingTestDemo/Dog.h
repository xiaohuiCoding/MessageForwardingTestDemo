//
//  Dog.h
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

- (void)drink;
- (void)playIn:(NSString *)place;
- (void)wakeUpFrom:(NSString *)place when:(NSString *)time;

- (void)sing;
- (void)danceIn:(NSString *)place;
- (void)offDutyFrom:(NSString *)place when:(NSString *)time;

@end
