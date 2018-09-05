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
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    Person *p = [[Person alloc] init];
    [p launch];
    NSLog(@"%s",__func__);
}

- (void)jumpToTestPage {
    [self.navigationController pushViewController:[[TestViewController alloc] init] animated:YES];
}

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
    

    
    //使用分类给对象添加属性和方法
    Person *p = [[Person alloc] init];
    [p other];
    p.name = @"xiaohui";
    NSLog(@"新增对象的属性：name = %@",p.name);
    [p eatFood];
    [Person eatFood];
    
    
    
    //使用分类给类添加属性和方法
    Person.associatedObjc = @"heiheihei";
    NSLog(@"新增类的属性：associatedObjc = %@",Person.associatedObjc);
    
    
    
    //测试在一个对象的生命周期中多次调用对象的同一方法
    [p launch];
    [p launch];
    NSLog(@"%s",__func__);
    
    
    
    //动态的创建一个类，添加成员变量，添加方法，添加属性，以及使用创建出来的类
    Class newClass = objc_allocateClassPair([Person class], "NewPerson", 0);
    class_addMethod(newClass, @selector(instanceMethod), (IMP)dynamicAddInstanceMethodImplementation, "v@:");
    //给新类添加成员变量
    class_addIvar(newClass, "_newName", sizeof(NSString *), log(sizeof(NSString *)), "i");
    //给新类添加属性
    objc_property_attribute_t type = {"T", "@\"NSString\""};
    objc_property_attribute_t c = { "C", "" };
    objc_property_attribute_t v = { "V", "_newName"};
    objc_property_attribute_t attrs[] = {type, c, v};
    class_addProperty(newClass, "newProperty", attrs, 3);
    //注册新类，注册后才可以使用新类
    objc_registerClassPair(newClass);
    //给新类添加类方法，其实是要给元类的方法列表新增方法
    Class metaClass = objc_getMetaClass("NewPerson");
    class_addMethod(metaClass, @selector(classMethod), (IMP)dynamicAddClassMethodImplementation, "v@:");
    //使用新类
    id instance = [[newClass alloc] init];
    [instance performSelector:@selector(instanceMethod)];
    [newClass performSelector:@selector(classMethod)];
    //输出新类的运行时属性
    [self logProperty:[newClass class]];
    
    
    
    //动态给已有类添加属性
    objc_property_attribute_t t2 = {"T", "@\"NSString\""};
    objc_property_attribute_t c2 = { "C", "" };
    objc_property_attribute_t v2 = { "V", "_newName"};
    objc_property_attribute_t attrs2[] = {t2, c2, v2};
    class_addProperty([Person class], "newName", attrs2, 3);
    //输出已有类的运行时属性
    [self logProperty:[Person class]];
    
    
    
    //类与元类
    Test *test = [[Test alloc] init];
    [test ex_registerClassPair];
}

void dynamicAddInstanceMethodImplementation(id self, SEL _cmd) {
    NSLog(@"new class's instance method execute");
}

void dynamicAddClassMethodImplementation(id self, SEL _cmd) {
    NSLog(@"new class's class method execute");
}

- (void)logProperty:(Class)class {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(class, &count);
    NSLog(@"属性的个数是：%d",count);
    for (NSInteger i=0; i<count; i++) {
        NSString *name = @(property_getName(properties[i]));
        NSString *attributes = @(property_getAttributes(properties[i]));
        NSLog(@"属性：%@ --- %@",name, attributes);
    }
}

@end
