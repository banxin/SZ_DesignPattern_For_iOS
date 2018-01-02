//
//  SZPrototypeViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZPrototypeViewController.h"
#import "SZResume.h"
#import "SZSubResume.h"
#import "SZWorkExperience.h"

/*
 原型模式
 
 具体了解 NSCoping和NSmutableCoping 即可
 */

@interface SZPrototypeViewController ()

@end

@implementation SZPrototypeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"原型模式";
    
    self.lblTips.text = @"轻触屏幕测试哦！！！";
    
    self.lblResult.text = @"注意观察控制台输出！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testPrototype];
}

- (void)testPrototype
{
    SZSubResume *resume1 = [[SZSubResume alloc] init];
    
    resume1.name = @"aaa";
    resume1.sex = @"男";
    resume1.age = @(10);
    
    SZWorkExperience *workExperience1 = [[SZWorkExperience alloc] init];
    
    workExperience1.workDate = @"2013";
    workExperience1.company = @"XX";
    
    resume1.workExperience = workExperience1;
    
    resume1.workExperienceAry = @[workExperience1];
    
    SZSubResume *resume2 = [resume1 copy];
    
//    resume2.name = @"bbb";
    resume2.sex = @"女";
    resume2.age = @(20);

    SZWorkExperience *workExperience2 = [workExperience1 copy];

//    workExperience2.workDate = @"2014";
    workExperience2.company = @"YY";

    resume2.workExperience = workExperience2;
    
//    resume2.workExperienceAry = @[workExperience2];
    
    SZSubResume *resume3 = [resume1 copy];
    
    resume3.name = @"ccc";
//    resume3.sex = @"未知";
//    resume3.age = @(30);
//
    SZWorkExperience *workExperience3 = [workExperience1 copy];

    workExperience3.workDate = @"2015";
//    workExperience3.company = @"ZZ";
//
    resume3.workExperience = workExperience3;
    
//    resume3.workExperienceAry = @[workExperience3];
    
    NSLog(@"resume1的地址:%p, resume1的workExperience的地址:%p, resume1的name:%@, resume1的workExperience的workDate:%@, resume1的workExperienceAry的地址:%p, resume1的workExperienceAry中元素的地址:%p", resume1, resume1.workExperience, resume1.name, resume1.workExperience.workDate, resume1.workExperienceAry, resume1.workExperienceAry[0]);

    NSLog(@"resume2的地址:%p, resume2的workExperience的地址:%p, resume2的name:%@, resume2的workExperience的workDate:%@, resume2的workExperienceAry的地址:%p, resume2的workExperienceAry中元素的地址:%p", resume2, resume2.workExperience, resume2.name, resume2.workExperience.workDate, resume2.workExperienceAry, resume2.workExperienceAry[0]);

    NSLog(@"resume3的地址:%p, resume3的workExperience的地址:%p, resume3的name:%@, resume3的workExperience的workDate:%@, resume1的workExperienceAry的地址:%p, resume1的workExperienceAry中元素的地址:%p", resume3, resume3.workExperience, resume3.name, resume3.workExperience.workDate, resume3.workExperienceAry, resume3.workExperienceAry[0]);
}

@end
