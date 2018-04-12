//
//  ViewController.m
//  runtimeDemo2
//
//  Created by Anan on 2018/4/10.
//  Copyright © 2018年 Anan. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController () <UITableViewDataSource> {
    NSArray *_property0;
    NSArray *property1;
}
@property (nonatomic, strong) UIColor *property2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // class获取--获取整个成员变量列表
    // 1. 获取所有私有变量和属性
    // 2. 获取的私有变量和定义的名一模一样
    // 3. 获取的属性的名前面都添加了下划线
    unsigned int copyIvarListCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &copyIvarListCount);
    for (NSInteger i = 0; i< copyIvarListCount; i ++) {
        
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSLog(@">>>>>>>>0:class_copyIvarList:%s",name);
    }
    free(ivars);//释放
    NSLog(@"\n");
    
    // class获取--获取整个属性列表（只获取属性不获取变量）
    // 1. 获取所有属性
    // 2. 获取的属性名和你代码写的一样，获取出来的属性名不自动添加下划线
    unsigned int copyPropertyListCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &copyPropertyListCount);
    for (NSInteger i = 0; i < copyPropertyListCount; i++) {
        objc_property_t property = propertys[i];
        const char *name = property_getName(property);
        NSLog(@">>>>>>>>>>1:copyPropertyList: %s", name);
    }
    free(propertys);// 释放
    NSLog(@"\n");
    
    // class获取--获取整个类的实例方法的方法列表
    // 1. 获取所有实例方法，不包含静态方法
    // 2. 不获取父类方法
    // 3. 隐式的get set方法也能获取到
    unsigned int copyMethodListCount = 0;
    Method *methods = class_copyMethodList([self class], &copyMethodListCount);
    for (NSInteger i = 0; i < copyMethodListCount; i++) {
        Method method = methods[i];
        SEL name = method_getName(method);
        NSLog(@">>>>>>>>>>2: copyMethodList:%@", NSStringFromSelector(name));
    }
    free(methods); // 释放
    NSLog(@"\n");
    
    // 添加--协议
    // 1. class addProtocol 参数含义：第一个：要添加协议的类，第二个：协议对象
    // 2. 获取协议列表具体细节参照Classsl里的内容
    unsigned int copyProtocolListCount = 0;
    Protocol * __unsafe_unretained *protocols = class_copyProtocolList([self class], &copyProtocolListCount);
    for (NSInteger i = 0; i < copyProtocolListCount; i++) {
        Protocol *protocol = protocols[i];
        const char *name = protocol_getName(protocol);
        NSLog(@">>>>>>>>>>3:copyProtocolList:%s", name);
    }
    free(protocols); // 释放
    NSLog(@"\n");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
