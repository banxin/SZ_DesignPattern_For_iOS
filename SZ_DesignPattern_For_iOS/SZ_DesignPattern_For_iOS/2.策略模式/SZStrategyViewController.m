//
//  SZStrategyViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/17.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZStrategyViewController.h"
#import "SZCashNormal.h"
#import "SZCashRebate.h"
#import "SZCashReturn.h"
#import "SZCashContext.h"

@interface SZStrategyViewController ()

@end

@implementation SZStrategyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"策略模式";
    
    self.lblTips.text = @"轻触屏幕测试哦!\nVC中存在仅使用策略模式测试和结合简单工厂模式的测试，自行注释测试！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1.仅仅使用策略模式的调用方式
    [self classicalStrategy:[self getRandomNumber:0 to:3] originCash:300];
    
    // 2.结合简单工厂模式的调用方式
//    [self strategyWithSimpleFactroy:[self getRandomNumber:0 to:3] originCash:300];
}

#pragma mark - private method

- (void)classicalStrategy:(NSInteger)type originCash:(CGFloat)originCash
{
    SZCashContext *context;
    
    if (type == 0) {
        
        context = [[SZCashContext alloc] initWithCashOperation:[[SZCashNormal alloc] init]];
        
    } else if (type == 1) {
        
        context = [[SZCashContext alloc] initWithCashOperation:[[SZCashRebate alloc] initWithMoneyRebate:0.7f]];
        
    } else if (type == 2) {
        
        context = [[SZCashContext alloc] initWithCashOperation:[[SZCashReturn alloc] initWithMoneyReturn:20 andCondition:100]];
        
    } else {
        
        context = [[SZCashContext alloc] initWithCashOperation:nil];
    }
    
    [self handleResult:context originCash:originCash];
}

- (void)strategyWithSimpleFactroy:(NSInteger)type originCash:(CGFloat)originCash
{
    SZCashContext *context = [[SZCashContext alloc] initWithCashType:type];
    
    [self handleResult:context originCash:originCash];
}

- (void)handleResult:(SZCashContext *)context originCash:(CGFloat)originCash
{
    CGFloat result = [context getResult:originCash];
    
    // 如果是不存在的结算方式
    if (result == -1) {
        
        self.lblResult.text = @"当前仅支持（'原价', '七折优惠', '满100减20'）三种结算方式，暂时不支持您的结算方式，如有需要，请联系PD！！！";
        
        return;
    }
    
    self.lblResult.text = [NSString stringWithFormat:@"原价：%.2f, 按 --> %@, 应收 --> %.2f", originCash, [context description], result];
}

@end
