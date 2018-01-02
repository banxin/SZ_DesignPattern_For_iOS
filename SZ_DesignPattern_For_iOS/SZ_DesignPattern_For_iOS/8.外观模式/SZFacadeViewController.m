//
//  SZFacadeViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZFacadeViewController.h"
#import "SZFund.h"

@interface SZFacadeViewController ()

@end

@implementation SZFacadeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"外观模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testFacade:[self getRandomNumber:0 to:2]];
}

- (void)testFacade:(NSInteger)type
{
    SZFund *fund = [SZFund new];
    
    switch (type) {
            
        case 0:
            
            self.lblResult.text = [fund buyFund];
            
            break;
            
        case 1:
            
            self.lblResult.text = [fund sellFund];
            
            break;
            
        default:
            
            self.lblResult.text = @"无效操作哦！！！";
            
            return;
            
            break;
    }
}

@end
