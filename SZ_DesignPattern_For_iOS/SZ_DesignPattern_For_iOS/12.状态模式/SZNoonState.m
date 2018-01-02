//
//  SZNoonState.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZNoonState.h"
#import "SZWork.h"
#import "SZAfternoonState.h"

@implementation SZNoonState

- (NSString *)writeProgram:(SZWork *)work
{
    if (work.hour < 13) {
        
        return [NSString stringWithFormat:@"当前时间：%zd，饿了，午饭；犯困，休息。", work.hour];
        
    } else {
        
        work.currentState = [SZAfternoonState new];
        
        return [work writeProgram];
    }
}

@end
