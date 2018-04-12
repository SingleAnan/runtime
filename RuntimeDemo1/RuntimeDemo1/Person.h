//
//  Person.h
//  RuntimeDemo20180403
//
//  Created by Anan on 2018/4/3.
//  Copyright © 2018年 Anan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;

extern NSString * const HTTP_URL;
extern const int DEFAULT_POST;

@end
