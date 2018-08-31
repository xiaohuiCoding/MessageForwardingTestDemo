//
//  Flower.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/28.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Flower.h"

@implementation Flower

+ (void)becomeTall {
    NSLog(@"长高");
}

+ (void)absorbNutrientsFrom:(NSString *)place {
    NSLog(@"从%@中吸收养分",place);
}

+ (void)dieOn:(NSString *)place when:(NSString *)time {
    NSLog(@"死于%@当%@到来的时候",place,time);
}

+ (void)becomeThick {
    NSLog(@"长粗");
}

@end
