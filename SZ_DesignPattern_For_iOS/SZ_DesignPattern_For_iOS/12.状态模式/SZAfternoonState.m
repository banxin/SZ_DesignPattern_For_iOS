//
//  SZAfternoonState.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZAfternoonState.h"
#import "SZWork.h"
#import "SZEveningState.h"

@implementation SZAfternoonState

- (NSString *)writeProgram:(SZWork *)work
{
    if (work.hour < 17) {
        
        return [NSString stringWithFormat:@"当前时间：%zd，下午状态还不错，继续努力！", work.hour];
        
    } else {
        
        work.currentState = [SZEveningState new];
        
        return [work writeProgram];
    }
}

@end
