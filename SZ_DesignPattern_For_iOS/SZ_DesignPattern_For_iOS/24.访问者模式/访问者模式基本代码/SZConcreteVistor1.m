//
//  SZConcreteVistor1.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteVistor1.h"

@implementation SZConcreteVistor1

- (NSString *)vistorConcreteElementA:(SZConcreteElementA *)concreteElementA
{
    return @"SZConcreteElementA被SZConcreteVistor1访问！";
}

- (NSString *)vistorConcreteElementB:(SZConcreteElementB *)concreteElementB
{
    return @"SZConcreteElementB被SZConcreteVistor1访问！";
}

@end
