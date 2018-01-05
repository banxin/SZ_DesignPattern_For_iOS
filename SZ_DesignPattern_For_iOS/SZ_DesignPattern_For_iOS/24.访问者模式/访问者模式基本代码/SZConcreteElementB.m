//
//  SZConcreteElementB.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteElementB.h"

@implementation SZConcreteElementB

- (NSString *)accept:(id<SZVistorProtocol>)vistor
{
    return [vistor vistorConcreteElementB:self];
}

@end
