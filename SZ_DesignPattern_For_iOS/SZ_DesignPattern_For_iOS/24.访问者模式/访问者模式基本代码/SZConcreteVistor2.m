//
//  SZConcreteVistor2.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteVistor2.h"

@implementation SZConcreteVistor2

- (NSString *)vistorConcreteElementA:(SZConcreteElementA *)concreteElementA
{
    return @"SZConcreteElementA被SZConcreteVistor2访问！";
}

- (NSString *)vistorConcreteElementB:(SZConcreteElementB *)concreteElementB
{
    return @"SZConcreteElementB被SZConcreteVistor2访问！";
}

@end
