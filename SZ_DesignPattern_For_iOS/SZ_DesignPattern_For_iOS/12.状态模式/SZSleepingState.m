//
//  SZSleepingState.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSleepingState.h"
#import "SZWork.h"

@implementation SZSleepingState

- (NSString *)writeProgram:(SZWork *)work
{
    return [NSString stringWithFormat:@"当前时间：%zd，不行了，睡着了！", work.hour];
}

@end
