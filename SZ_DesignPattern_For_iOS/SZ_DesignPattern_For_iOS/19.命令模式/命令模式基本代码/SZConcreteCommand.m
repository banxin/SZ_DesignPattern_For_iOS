//
//  SZConcreteCommand.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/1.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteCommand.h"

@implementation SZConcreteCommand

@synthesize receiver = _receiver;

- (NSString *)execute
{
    return [_receiver action];
}

@end
