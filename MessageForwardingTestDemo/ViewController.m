//
//  ViewController.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/27.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
//    self.automaticallyAdjustsScrollViewInsets = NO;//iOS 11.0后被弃用
    //iOS 11.0后才有的属性
    self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    People *p = [[People alloc] init];
    
    [p walkOn:@"马路"];

    [p eat];
    
    [p sing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
