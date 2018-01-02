//
//  SZBoss.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZBoss.h"
#import "SZObserve.h"

@implementation SZBoss

@synthesize SZSubjectCallBack = _callBack;

- (NSString *)stateStr
{
    return @"老板通知：我回来了!!!";
}

- (void)notify
{    
    _callBack();
}

@end
