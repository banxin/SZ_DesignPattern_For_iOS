//
//  SZInvoker.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZInvoker.h"

@implementation SZInvoker

- (NSString *)executeCommand
{
    return [_command execute];
}

@end
