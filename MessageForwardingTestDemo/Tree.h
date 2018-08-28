//
//  Tree.h
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/28.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

+ (void)grow;
+ (void)swingWhen:(NSString *)time;
+ (void)lookLike:(NSString *)something orLike:(NSString *)other;

+ (void)becomeTall;
+ (void)absorbNutrientsFrom:(NSString *)place;
+ (void)dieOn:(NSString *)place when:(NSString *)time;

@end
