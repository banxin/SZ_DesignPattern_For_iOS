//
//  SZSubResume.h
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/21.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZResume.h"
#import "SZWorkExperience.h"

@interface SZSubResume : SZResume

@property (nonatomic, assign) NSInteger workingSeniority;

@property (nonatomic, strong) SZWorkExperience *workExperience;

@property (nonatomic, strong) NSArray<SZWorkExperience *> *workExperienceAry;

@end
