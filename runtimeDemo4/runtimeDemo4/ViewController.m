//
//  ViewController.m
//  runtimeDemo4
//
//  Created by Anan on 2018/4/12.
//  Copyright © 2018年 Anan. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self method0];
    BOOL result0 = class_replaceMethod([self class], @selector(method0), (IMP)method1, NULL);
    NSLog(@">>>>>>>>>>2:%@", @(result0));
    [self method0];
}

-(void)method0{
    NSLog(@">>>>>>>>0");
    
}
void method1(){
    NSLog(@">>>>>>>>1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
