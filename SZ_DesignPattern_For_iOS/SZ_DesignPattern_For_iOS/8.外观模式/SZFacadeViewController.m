//
//  SZFacadeViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZFacadeViewController.h"
#import "SZFund.h"

/*
 通过股民炒股和投资基金的区别引入问题。
 需求，编写一个股民炒股程序，股民需要操作多个股票的买入卖出。
 版本1
 股票类1、2、3、4、5都有买、卖的接口，股民需要分别调用5次买卖接口。
 问题：代码耦合性过高。
 版本2
 股票类不做改变，但是股民类通过调用一个基金经理类的中间层来买卖股票，这样就简化了代码，降低了耦合度。
 
 外观模式
 • 外观模式是为子系统中的一组接口提供一个一致的界面，此模式定义了一个高层接口，这个接口使得这一子系统更加容易调用（个人理解这其实就相当于代码的抽取封装）。
 • 在设计的初期阶段，就应该有意识的让两个不同的层分离，在层与层之间建立外观Facade，为复杂的子系统提供一个简单的接口，降低耦合度。
 外观模式其实就是依赖倒置原则和迪米特法则的体现。
 */

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
