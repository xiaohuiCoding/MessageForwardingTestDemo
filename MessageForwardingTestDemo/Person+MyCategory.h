//
//  Person+MyCategory.h
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/9/4.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "Person.h"

@interface Person (MyCategory)
//{
//    //不允许这样给分类直接添加成员变量，因为在运行期，对象的内存布局已经确定，如果添加成员变量会破坏类的内部布局
//    NSString *name;
//}

//@property (nonatomic, copy) NSString *smallName; //Property 'smallName' requires method 'smallName' to be defined - use @dynamic

@property (nonatomic, copy) NSString *name; //可以这样给分类直接添加属性，但无法使用；可以利用runtime关联对象来模拟实现setter和getter方法，然后才可使用所添加的属性

- (void)eatFood;
+ (void)eatFood;

+ (void)setAssociatedObjc:(NSString *)associatedObjc;
+ (NSString *)associatedObjc;

@end
