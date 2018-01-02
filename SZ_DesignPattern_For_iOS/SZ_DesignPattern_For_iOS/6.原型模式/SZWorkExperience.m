//
//  SZWorkExperience.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZWorkExperience.h"

@implementation SZWorkExperience

- (id)copyWithZone:(NSZone *)zone
{
    SZWorkExperience *workExperience = [[[self class] allocWithZone:zone] init];
    
    workExperience.workDate = self.workDate;
    workExperience.company = self.company;
    
    return workExperience;
}

@end
