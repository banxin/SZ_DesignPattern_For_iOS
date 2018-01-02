//
//  SZAdapterViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZAdapterViewController.h"
#import "SZPlayerProtocol.h"
#import "SZForwards.h"
#import "SZCenter.h"
#import "SZGuards.h"
#import "SZCNCenter.h"
#import "SZTranslator.h"

@interface SZAdapterViewController ()

@end

@implementation SZAdapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"适配器模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testAdapter];
}

// 测试，模拟姚明初入NBA时，需要翻译的场景
- (void)testAdapter
{
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@""];
    
    id<SZPlayerProtocol> battier = [SZForwards new];
    
    battier.name = @"Battier";
    
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [battier attack]]];
    
    id<SZPlayerProtocol> mcGrady = [SZGuards new];
    
    mcGrady.name = @"McGrady";
    
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [mcGrady attack]]];
    
    id<SZPlayerProtocol> yaoming = [SZTranslator new];
    
    yaoming.name = @"姚明";
    
    [showStr appendString:[NSString stringWithFormat:@"%@\n%@\n", [yaoming attack], [yaoming defence]]];
    
    self.lblResult.text = showStr;
}

@end

















