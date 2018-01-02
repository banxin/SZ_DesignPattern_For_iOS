//
//  SZViewBridgeController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/28.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZViewBridgeController.h"

// 基本代码
#import "SZConcreteImplementorA.h"
#import "SZConcreteImplementorB.h"
#import "SZRefinedAbstraction.h"

// 事例代码
#import "SZMobileBrandProtocol.h"
#import "SZMobileBrandN.h"
#import "SZMoblieBrandM.h"
#import "SZMobileGame.h"
#import "SZMobileAddressList.h"

@interface SZViewBridgeController ()

@end

@implementation SZViewBridgeController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.title = @"桥接模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testBasicBridge] : [self testReflex];
}

// 测试基本代码
- (void)testBasicBridge
{
    SZRefinedAbstraction *refinedAbstraction = [SZRefinedAbstraction new];
    
    refinedAbstraction.implementor = [SZConcreteImplementorA new];
    
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@\n", [refinedAbstraction operation]]];
    
    refinedAbstraction.implementor = [SZConcreteImplementorB new];
    
    [showStr appendString:[refinedAbstraction operation]];
    
    self.lblResult.text = showStr;
}

// 测试事例代码
- (void)testReflex
{
    id<SZMobileBrandProtocol> mobileBrand = [self getRandomNumber:0 to:1] == 0 ? [SZMobileBrandN new] : [SZMoblieBrandM new];
    
    mobileBrand.mobileSoft = [SZMobileGame new];
    
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@\n", [mobileBrand run]]];
    
    mobileBrand.mobileSoft = [SZMobileAddressList new];
    
    [showStr appendString:[mobileBrand run]];
    
    self.lblResult.text = showStr;
}

@end
