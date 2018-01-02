//
//  SZWork.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZWork.h"
#import "SZForenoonState.h"

@implementation SZWork

- (instancetype)init
{
    if (self = [super init]) {
        
        self.currentState = [SZForenoonState new];
    }
    
    return self;
}

- (NSString *)writeProgram
{
    return [self.currentState writeProgram:self];
    
//    // 原始判断逻辑
//    if (self.hour < 12) {
//
//        return [NSString stringWithFormat:@"当前时间：%zd，上午工作，精神百倍", self.hour];
//
//    } else if (self.hour < 13) {
//
//        return [NSString stringWithFormat:@"当前时间：%zd，饿了，午饭；犯困，休息。", self.hour];
//
//    } else if (self.hour < 17) {
//
//        return [NSString stringWithFormat:@"当前时间：%zd，下午状态还不错，继续努力！", self.hour];
//
//    } else {
//
//        if (self.isTaskFinish) {
//
//            return [NSString stringWithFormat:@"当前时间：%zd，下班了，回家了！", self.hour];
//
//        } else {
//
//            if (self.hour < 21) {
//
//                return [NSString stringWithFormat:@"当前时间：%zd，加班哦，疲累之极", self.hour];
//
//            } else {
//
//                return [NSString stringWithFormat:@"当前时间：%zd，不行了，睡着了！", self.hour];
//            }
//        }
//    }
}

@end
