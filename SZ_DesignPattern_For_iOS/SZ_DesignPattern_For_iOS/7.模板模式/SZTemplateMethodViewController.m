//
//  SZTemplateMethodViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/21.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZTemplateMethodViewController.h"
#import "SZAnswerProtocol.h"
#import "SZTestPaper.h"
#import "SZTestPaperA.h"
#import "SZTestPaperB.h"

@interface SZTemplateMethodViewController ()

@end

@implementation SZTemplateMethodViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"模板方法模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testTemplate:[self getRandomNumber:0 to:2]];
}

- (void)testTemplate:(NSInteger)type
{
    SZTestPaper *paper;
    
    switch (type) {
            
        case 0:
            
            paper = [SZTestPaperA new];
            
            break;
            
        case 1:
            
            paper = [SZTestPaperB new];
            
            break;
            
        default:
            
            self.lblResult.text = @"不存在该学生的试卷哦！！！";
            
            return;
            
            break;
    }
    
    self.lblResult.text = [NSString stringWithFormat:@"%@, %@ \n %@", [paper description], [paper testQuestion1], [paper testQuestion2]];
}

@end
