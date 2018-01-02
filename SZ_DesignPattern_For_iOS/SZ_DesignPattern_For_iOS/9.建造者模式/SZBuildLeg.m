//
//  SZBuildLeg.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZBuildLeg.h"

@implementation SZBuildLeg

- (NSString *)buildLeg:(SZBuildLegType)legType
{
    if (legType == SZBuildLegTypeLeft) {
        
        return @"建造了左腿！";
    }
    
    return @"建造了右腿！";
}

@end
