//
//  ViewController.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "ClassA.h"
#import "ClassB.h"
#import "Person.h"
#import <objc/runtime.h>
#import "Person+MyCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(jumpToTestPage)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    //self与super
    ClassB *classB = [[ClassB alloc] init];
    [classB test];
    [classB test2];
    [classB test3];
    [classB test4];
    
    
    //获取类的运行时属性
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    NSLog(@"属性的个数是：%d",count);
    for (NSInteger i=0; i<count; i++) {
        NSString *name = @(property_getName(properties[i]));
        NSString *attributes = @(property_getAttributes(properties[i]));
        NSLog(@"属性：%@ --- %@",name, attributes);
    }
    
    
    //给类添加属性和方法
    Person *p = [[Person alloc] init];
    p.name = @"xiaohui";
    NSLog(@"新增的属性：name=%@",p.name);
    [p eatFood];
}

- (void)jumpToTestPage {
    [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
}

@end
