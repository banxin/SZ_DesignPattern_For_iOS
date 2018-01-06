//
//  SZFlyweightViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZFlyweightViewController.h"

// 基本代码
#import "SZFlyweightFactory.h"
#import "SZConcreteFlyweight.h"
#import "SZUnsharedConcreteFlyweight.h"

// 事例代码
#import "SZWebsiteFactory.h"
#import "SZConcreteWebsite.h"

/*
 由多个项目共享代码引入问题。
 需求，做N个同类型但表现形式不同的网站。
 版本1
 N个网站单独实现。
 问题：网站内部其实很多逻辑都是相同相似的，而且网站之间也可以共享服务资源，比如存储、计算、网络带宽资源等。
 版本2
 类似于调用私有库，网站类在需要的情况下向网站工厂请求所需的功能对象，这样就做到了模块共享。
 
 享元模式
 • 享元模式是运用共享技术有效地支持大量细粒度的对象。
 • 享元模式可以避免大量非常相似类的开销，在程序设计中，有时需要生成大量细粒度的类实例来表示数据。如果能发现这些实例除了几个参数外基本上都是相同的，有时就能够大幅度地减少需要实例化类的数量。如果能把那些参数移到类实例的外面，在方法调用时将它们传递进来，就可以通过共享大幅度地减少单个实例的数目。
 • 如果一个应用程序使用了大量的对象，而大量的对象造成了很大的存储开销（资源浪费）时就应该使用。但是反过来说，享元模式需要维护一个记录了系统已有的所有享元的列表，本身就耗费资源，而且这使得系统逻辑更加复杂，所以应该在有足够多的对象实例可以共享的时候才值得使用享元模式。
 */

@interface SZFlyweightViewController ()

@end

@implementation SZFlyweightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"享元模式";

    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testBasic] : [self testReflex];
}

- (void)testBasic
{
    NSInteger extrinsicstate = 22;
    
    SZFlyweightFactory *factory = [SZFlyweightFactory new];
    
    SZConcreteFlyweight *fx = [factory fetchFlyweight:@"X"];
    
//    [fx operation:extrinsicstate--];
    
    SZConcreteFlyweight *fy = [factory fetchFlyweight:@"Y"];
    
//    [fy operation:extrinsicstate--];
    
    SZConcreteFlyweight *fz = [factory fetchFlyweight:@"Z"];
    
//    [fz operation:extrinsicstate--];
    
    SZUnsharedConcreteFlyweight *uf = [SZUnsharedConcreteFlyweight new];
    
//    [uf operation:extrinsicstate--];
    
    self.lblResult.text = [NSString stringWithFormat:@"基本代码测试：\n\n%@\n%@\n%@\n%@", [fx operation:extrinsicstate--], [fy operation:extrinsicstate--], [fz operation:extrinsicstate--], [uf operation:extrinsicstate--]];
}

- (void)testReflex
{
    SZWebsiteFactory *factory = [SZWebsiteFactory new];
    
    SZConcreteWebsite *wx = [factory fetchWebsite:@"产品展示"];
    
    SZConcreteWebsite *wy = [factory fetchWebsite:@"产品展示"];
    
    SZConcreteWebsite *wz = [factory fetchWebsite:@"产品展示"];
    
    SZConcreteWebsite *bx = [factory fetchWebsite:@"博客"];
    
    SZConcreteWebsite *by = [factory fetchWebsite:@"博客"];
    
    SZConcreteWebsite *bz = [factory fetchWebsite:@"博客"];
    
    self.lblResult.text = [NSString stringWithFormat:@"基本代码测试：\n\n%@\n%@\n%@\n%@\n%@\n%@\n网站分类总数：%zd", [wx use], [wy use], [wz use], [bx use], [by use], [bz use], [factory fetchWebsiteCount]];
}

@end
