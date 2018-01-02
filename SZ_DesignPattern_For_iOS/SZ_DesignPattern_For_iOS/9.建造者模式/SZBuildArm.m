//
//  SZBuildArm.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZBuildArm.h"

@implementation SZBuildArm

- (NSString *)buildArm:(SZBuildArmType)armType
{
    if (armType == SZBuildArmTypeLeft) {
        
        return @"建造了左手！";
    }
    
    return @"建造了右手！";
}

@end
