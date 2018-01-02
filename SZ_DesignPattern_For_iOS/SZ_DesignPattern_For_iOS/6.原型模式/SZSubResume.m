//
//  SZSubResume.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/21.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSubResume.h"

@implementation SZSubResume

- (id)copyWithZone:(NSZone *)zone
{
    SZSubResume *resume = [super copyWithZone:zone];
    
    resume.workingSeniority = self.workingSeniority;
    
    resume.workExperience = [self.workExperience copy];
    
//    resume.workExperienceAry = [self.workExperienceAry mutableCopy];
    
    resume.workExperienceAry = [[NSArray alloc] initWithArray:self.workExperienceAry copyItems:YES];
    
//    resume.workExperienceAry = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self.workExperienceAry]];
    
    return resume;
}

@end
