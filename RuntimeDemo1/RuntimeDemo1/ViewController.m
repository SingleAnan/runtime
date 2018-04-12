//
//  ViewController.m
//  RuntimeDemo20180403
//
//  Created by Anan on 2018/4/3.
//  Copyright © 2018年 Anan. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (nonatomic, strong) NSArray *property0;
@property (nonatomic, strong) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 获取类名
    // 入参: 类Class
    // 返回: 类名char数组
    const char *result0 = class_getName([ViewController class]);
    NSLog(@">>>>>>>>>>0: %@", [NSString stringWithUTF8String:result0]);
    
    // 获取父类
    // 入参：类Class
    // 返回：类Class
    Class result1 = class_getSuperclass([ViewController class]);
    NSLog(@">>>>>>>>>>1: %@", result1);
    
    // 获取实例大小（返回size_t）
    // 入参：实例的类Class
    // 返回：大小size_t
    size_t result2 = class_getInstanceSize([ViewController class]);
    NSLog(@">>>>>>>>>>2: %zu", result2);
    
    // 获取类中指定名称实例成员变量的信息
    // 入参：类Class，变量名
    // 返回：变量信息Ivar
    // 1. 实例变量是指变量不是属性。例如某类有个属性为：username那么它对应的实例变量为_username
    // 2. 这个方法可以获取属性的变量，也可以获取私有变量（这点很重要）
    // 3. 如果获取的变量为空，那么 ivar_getName 和 ivar_TypeEncoding 获取的值为空，那么 [NSString stringWithUTF8String:ivarlName] 执行崩溃
    const char *result3 = [@"person" UTF8String];
    Ivar result4 = class_getInstanceVariable([ViewController class], result3);
    NSLog(@">>>>>>>>>>3: %@", result4);
    
    // 获取指定的属性
    // 入参： 类Class，属性名char数组
    // 返回： 属性objc_property_t
    // 1. 属性不是变量，此方法只能获取属性
    // 2. 如果属性不存在那么返回的结构体为0（可以参考下面的判断）
    // 3. 属性不存在获取property_getName 和 property_getAttributes 会崩溃
    const char *result5 = [@"property0" UTF8String];
    objc_property_t result6 = class_getProperty([ViewController class], result5);
    NSLog(@">>>>>>>>>>4: %@", [NSString stringWithUTF8String:property_getName(result6)]);
    
    // 获取方法实现
    // 入参： 类Class， 方法名SEL
    //； 返回： 方法实现IMP
    IMP result7 = class_getMethodImplementation([ViewController class], @selector(method0));
    result7();
    
    // 获取方法实现
    // 入参： 类Class， 方法名SEL
    //； 返回： 方法实现IMP
    IMP result8 = class_getMethodImplementation_stret([ViewController class], @selector(method1));
    result8();
    
    // 获取类方法
    // 入参：类Class，方法名SEL
    // 返回：方法Method
    Method result9 = class_getClassMethod([ViewController class], @selector(viewDidLoad));
    NSLog(@">>>>>>>>>>7: %@", result9);
}

-(void)method0{
    NSLog(@">>>>>>>>5");
}
-(void)method1{
    NSLog(@">>>>>>>>6");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
