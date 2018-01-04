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

@interface SZFlyweightViewController ()

@end

@implementation SZFlyweightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

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
