//
//  People.h
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

- (void)eat;
- (void)workIn:(NSString *)place;
- (void)sleepOn:(NSString *)place when:(NSString *)time;

- (void)drink;
- (void)playIn:(NSString *)place;
- (void)wakeUpFrom:(NSString *)place when:(NSString *)time;

- (void)sing;
- (void)danceIn:(NSString *)place;
- (void)offDutyFrom:(NSString *)place when:(NSString *)time;

- (void)run;
- (void)jump;
- (void)walk:(NSInteger)distance;

@end
