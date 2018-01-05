//
//  SZConcreteElementA.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteElementA.h"
#import "SZElementProtocol.h"

@implementation SZConcreteElementA

/*
 充分利用双分派技术，实现处理与数据结构的分类
 */
- (NSString *)accept:(id<SZVistorProtocol>)vistor
{
    return [vistor vistorConcreteElementA:self];
}

@end
