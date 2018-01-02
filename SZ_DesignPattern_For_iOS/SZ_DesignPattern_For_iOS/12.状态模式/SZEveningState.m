//
//  SZEveningState.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZEveningState.h"
#import "SZWork.h"
#import "SZSleepingState.h"
#import "SZRestState.h"

@implementation SZEveningState

- (NSString *)writeProgram:(SZWork *)work
{
    if (work.isTaskFinish) {
        
        work.currentState = [SZRestState new];
        
        return [work writeProgram];
        
    } else {
        
        if (work.hour < 21) {
            
            return [NSString stringWithFormat:@"当前时间：%zd，加班哦，疲累之极", work.hour];
            
        } else {
            
            work.currentState = [SZSleepingState new];
            
            return [work writeProgram];
        }
    }
}

@end
