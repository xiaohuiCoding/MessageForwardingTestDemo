//
//  Person.h
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/9/3.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *nameString; //可以这样给类直接添加成员变量
}

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) char hobby;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) double weight;
@property (nonatomic, assign) BOOL isChinese;

- (void)launch;

- (void)other;

@end
