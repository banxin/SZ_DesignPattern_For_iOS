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

/*
 通过一个商场收银软件来引入话题。
 需求，商场收银软件，收银员根据客户购买的商品的单价和数量向客户收费。用两个textField输入单价和数量，一个label显示总计，一个tableView记录商品清单。
 版本1
 确认按钮点击事件中处理计算商品总价、更新商品列表等等相关逻辑。
 问题：当需要修改商品价格计算逻辑的时候，如打折、满减，就需要改动逻辑部分代码，而且更换一次就要改用一次。
 版本2
 添加下拉选框中提供对应的价格计算逻辑，然后在逻辑中根据选框中的index决定对应计算逻辑。
 问题：逻辑部分耦合度还是高，应该跟之前的运算方法一样将价格计算逻辑抽成对象，使用简单工厂模式创建相关逻辑，逻辑中提供相关初始化参数如打折幅度、满X减Y。
 版本3
 抽离价格计算逻辑类，抽象类包含各种实际子类，创建时进行初始化。
 问题：如果需要打折+满减则又不满足需求。
 版本4
 应用策略模式。价格计算抽象类就是抽象策略，正常收费、打折、返利等具体计算方法就是具体策略。客户端只需要给cashContext配置需要什么策略，context内部自行生成相关的价格计算逻辑，这样客户端就不需要引入计算逻辑抽象类和工厂方法类，进一步降低了耦合度。
 
 策略模式
 • 面向对象的编程并不是类越多越好，类的划分是为了封装，但分类的基础是抽象，具有相同属性和功能的对象的抽象集合才是类。
 • 策略模式（Strategy）定义了算法家族，分别封装起来，让他们之间可以互相替换，此模式让算法的变化，不会影响到使用算法的客户。
 • 策略模式是一种定义一系列算法的方法，从概念上来看，所有算法完成的都是相同的工作，只是具体实现不同，他可以以相同的方式调用所有的算法，减小了各种算法类与使用算法类之间的耦合。
 • 策略模式为Context定义了一系列可供重用的算法或者行为，继承有助于析取出这些算法中的公共功能，打折、返利或者其他的算法，都是对实际商品收费的一种计算方式，通过继承可以得到他们的公共功能。
 • 策略模式还简化了单元测试，因为每个算法都有自己的类，可以通过自己的接口单独测试，算法之间也相互独立。
 • 当不同的行为堆砌在一个类中时，就很难避免使用条件语句来选择合适的行为。将这些行为封装到一个个不同的策略类中，可以使用这些行为的类中消除条件语句（个人；理解是从把客户端中的判断逻辑转移到context中）。
 • 策略模式就是用来封装算法的，但是在实践中，我们可以用来封装各种类型的规则，只要在分析过程中听到需要在不同的时间应用不同的业务规则，就可以考虑使用策略模式处理这种变化的可能性。
 • 在基本的策略模式中，选择所用的具体策略的职责还是由客户端承担，并转移给context对象，并没有减轻客户端需要选择判断的压力，而策略模式与简单工厂模式结合后，选择具体实现的职责也由context承担，这就最大化的减轻了客户端的职责。但是仍有一点不足，就是依然在context中用到了switch，后面的反射会解决这个问题。
 • 任何需求的变更都是需要成本的，但高手和菜鸟的区别就是高手可以花更小的代价获取更大的收益。
 
 */

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
