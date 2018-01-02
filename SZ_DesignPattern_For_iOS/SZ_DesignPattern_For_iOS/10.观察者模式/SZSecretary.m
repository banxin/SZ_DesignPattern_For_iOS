//
//  SZSecretary.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSecretary.h"
#import "SZObserve.h"

@implementation SZSecretary

@synthesize SZSubjectCallBack = _callBack;

- (NSString *)stateStr
{
    return @"秘书通知：老板回来了!!!";
}

- (void)notify
{    
    _callBack();
}

@end
