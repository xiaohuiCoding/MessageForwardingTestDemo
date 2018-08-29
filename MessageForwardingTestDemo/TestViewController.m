//
//  TestViewController.m
//  MessageForwardingTestDemo
//
//  Created by xiaohui on 2018/8/29.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "TestViewController.h"
#import "People.h"
#import "Tree.h"
#import "UIScrollView+MethodForwarding.h"

@interface TestViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation TestViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    People *p = [[People alloc] init];
    
    //1.动态添加实例方法
    [p eat];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //测试一：
    
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
        //iOS 11.0后弃用
        self.automaticallyAdjustsScrollViewInsets = NO;
    
        //iOS 11.0后新增（在低版本iOS系统中执行此句代码程序会闪退！）
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    
    
    //测试二：
    
    /***实例方法的调用***/
    //    People *p = [[People alloc] init];
    
    //1.动态添加实例方法
    //    [p eat];
    //    [p workIn:@"公司"];
    //    [p sleepOn:@"床" when:@"夜晚"];
    //
    //    //2.消息转发(重定向对象)
    //    [p drink];
    //    [p playIn:@"游乐园"];
    //    [p wakeUpFrom:@"床" when:@"白天"];
    //
    //    //3.消息转发
    //    [p sing];
    //    [p danceIn:@"公司"];
    //    [p offDutyFrom:@"公司" when:@"下午六点"];
    //    [p run];
    //    [p jump];
    //    [p walk:1000];
    
    /***类方法的调用***/
    
    //1.动态添加类方法
    //    [Tree grow];
    //    [Tree swingWhen:@"刮风"];
    //    [Tree lookLike:@"巨人" orLike:@"猛兽"];
    //
    //2.消息转发(重定向对象)
    //    [Tree becomeTall];
    //    [Tree absorbNutrientsFrom:@"土壤"];
    //    [Tree dieOn:@"大地" when:@"冬季"];
    
    //3.消息转发
}

@end
