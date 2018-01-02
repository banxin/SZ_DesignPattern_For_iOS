//
//  SZBuildPersonDirector.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZBuildPersonDirector.h"

@implementation SZBuildPersonDirector

- (NSString *)buildPerson
{
    if (self.buildDirector) {
        
        return [self.buildDirector buildPerson];
    }
    
    return @"不存在的Builder类，无法建造！！！";
}

@end
