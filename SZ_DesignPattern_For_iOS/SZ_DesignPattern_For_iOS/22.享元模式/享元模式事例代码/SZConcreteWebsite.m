//
//  SZConcreteWebsite.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteWebsite.h"

@implementation SZConcreteWebsite

- (NSString *)use
{
    return [NSString stringWithFormat:@"网站分类：%@", self.name];
}

@end
