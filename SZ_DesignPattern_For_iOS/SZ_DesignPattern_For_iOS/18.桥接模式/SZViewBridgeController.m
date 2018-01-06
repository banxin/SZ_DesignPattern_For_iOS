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

/*
 通过手机品牌和手机软件的关系引入问题。
 需求，写一个有N个品牌的手机和M种APP，并表示之间的关系。（实际上，手机与APP并没有直接的联系，真实的情况应该是手机对应操作系统，操作系统再对应具体的APP）
 版本1
 手机抽象类有N个具体子类，手机具体子类有M个软件子类。
 问题：增加、修改会变得很复杂，而且手机和APP并不应该是父子类关系。
 版本2
 手机实体子类中有软件属性。
 
 桥接模式
 • 桥接模式（Bridge）将抽象部分与它的实现部分分离，使它们都可以独立地变化。由于实现方式有多种，桥接模式的核心意图就是把这些实现独立出来，让他们各自变化，这就使得每种实现的变化不会影响其他实现，从而达到应对变化的目的。
 • 对象的继承关系在编译时就已经确定好了，所以无法在运行时改变从父类继承的实现。子类的实现与它父类有非常紧密的依赖关系，以至于在父类实现中的任何变化必然会导致子类发生变化。当你需要复用子类时，如果继承下来的实现不适合解决新的问题，则父类必须重写或被其他更适合的类替换，这种依赖关系限制了灵活性并最终限制了复用性。
 • 合成/聚合复用原则（CARP），尽量使用合成/聚合，尽量不要使用继承。合成和聚合都是关联的特殊种类，聚合表示一种弱的拥有关系，体现的是A对象可以包含B对象，但B对象不是A毒想的一部分；合成则是一种强的拥有关系，体现了严格的部分和整体的关系，部分和整体的生命周期一样。
 合成/聚合复用原则的好处是优先使用对象的合成/聚合将有助于你保持每个类被封装，并被集中在单个任务上，这样类和类继承层次会保持较小规模，并不太可能增长成为不可控制的庞然大物。
 */

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
