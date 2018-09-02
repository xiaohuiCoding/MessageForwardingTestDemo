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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(jumpToTestPage)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    ClassB *classB = [[ClassB alloc] init];
    [classB test];
    [classB test2];
    [classB test3];
    [classB test4];
}

- (void)jumpToTestPage {
    [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
}

@end
