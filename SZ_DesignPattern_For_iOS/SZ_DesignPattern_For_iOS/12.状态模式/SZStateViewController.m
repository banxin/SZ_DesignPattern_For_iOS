//
//  SZStateViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZStateViewController.h"
#import "SZWork.h"

@interface SZStateViewController ()

@end

@implementation SZStateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"状态模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testState:[self getRandomNumber:0 to:1]];
}

- (void)testState:(NSInteger)finishType
{
    NSMutableString *workStateStr = [NSMutableString stringWithString:@""];
    
    // 紧急项目
    SZWork *emergencyProjects = [SZWork new];
    
    emergencyProjects.hour = 9;
    
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 10;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 12;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 13;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 14;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 17;
    
    if (finishType == 0) {
        
        emergencyProjects.isTaskFinish = NO;
        
    } else {
        
        emergencyProjects.isTaskFinish = YES;
    }
    
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 19;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    emergencyProjects.hour = 22;
    [workStateStr appendString:[NSString stringWithFormat:@"%@\n", [emergencyProjects writeProgram]]];
    
    self.lblResult.text = workStateStr;
}

@end












