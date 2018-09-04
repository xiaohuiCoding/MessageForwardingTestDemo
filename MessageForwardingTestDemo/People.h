//
//  People.h
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObject.h"

typedef struct MyStruct {
    NSInteger ID;
//    NSString *name; //ARC forbids Objective-C objects in struct
    char *hobby;
//    char hobby2;
    int age;
    float height;
    double weight;
    bool isChinese;
} MyStruct;

@interface People : NSObject

- (void)eat;
- (void)workIn:(NSString *)place;
- (void)sleepOn:(NSString *)place when:(NSString *)time;

- (char *)test;
- (void)test2:(MyStruct)test;
- (MyStruct)test3:(MyStruct)test;

- (void)drink;
- (void)playIn:(NSString *)place;
- (void)wakeUpFrom:(NSString *)place when:(NSString *)time;

- (void)sing;
- (void)danceIn:(NSString *)place;
- (void)offDutyFrom:(NSString *)place when:(NSString *)time;

- (void)run;
- (void)jump;
- (void)walk:(NSInteger)distance;

- (void)normal;
- (void)crashHaHaHa;

@end
