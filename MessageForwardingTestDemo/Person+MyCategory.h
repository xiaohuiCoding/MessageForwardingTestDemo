//
//  Person+MyCategory.h
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/9/4.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Person.h"

@interface Person (MyCategory)

@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *smallName; //Property 'smallName' requires method 'smallName' to be defined - use @dynamic

- (void)eatFood;

@end
