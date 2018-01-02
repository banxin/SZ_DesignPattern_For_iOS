//
//  SZRestState.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZRestState.h"
#import "SZWork.h"

@implementation SZRestState

- (NSString *)writeProgram:(SZWork *)work
{
    return [NSString stringWithFormat:@"当前时间：%zd，下班了，回家了！", work.hour];
}

@end
