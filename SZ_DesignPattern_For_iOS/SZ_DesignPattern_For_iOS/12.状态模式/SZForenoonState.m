//
//  SZForenoonState.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZForenoonState.h"
#import "SZWork.h"
#import "SZNoonState.h"

@implementation SZForenoonState

- (NSString *)writeProgram:(SZWork *)work
{
    if (work.hour < 12) {
        
        return [NSString stringWithFormat:@"当前时间：%zd，上午工作，精神百倍", work.hour];
        
    } else {
        
        work.currentState = [SZNoonState new];
        
        return [work writeProgram];
    }
}

@end
