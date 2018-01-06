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

/*
 通过姚明去NBA开始需要专人翻译交流沟通引入话题。姚明刚到NBA不会英文无法与他人交流，而短时间内不能让姚明学会英语，而他的队友也不能短时间学会中文，只能给姚明配备翻译。
 需求，模拟教练给后卫、中锋、前锋分配进攻和防守任务。
 版本1
 球员抽象类有三个子类后卫、中锋、前锋，分别实现进攻和防守的方法。
 问题：但是姚明（中锋）不懂英语，所以他的方法也不是父类的虚方法，并不能直接调用，而是需要一个适配器（翻译）。
 版本2
 教练向中锋分配任务时向翻译分配，然后翻译在向姚明转达。
 
 适配器模式
 • 适配器（Adapter）模式是将一个类的接口转换成客户希望的另外一个接口，Adapter模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。
 • 当系统的数据和行为都正确，但是接口不符的时候，应该考虑使用适配器，目的是是控制范围之外的一个原有对象与某个接口匹配。适配器模式主要应用于希望复用一些现存的类，但是接口又与复用环境要求不一致的情况。比如在需要对早期代码进行复用的时候很有价值。
 • 在GOF的设计模式中，对适配器模式划分为两种类型，类适配器和对象适配器模式。
 • 想要使用一个已经存在的类，但如果它的接口，和需求不同时，而且双方都不太容易修改的时候再使用适配器模式适配。两个类所做的事情相同或相似，但是具有不同的接口对象时要使用它。这样客户端只要调用同一接口就可以了。
 */

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
