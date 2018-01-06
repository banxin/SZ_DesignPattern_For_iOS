//
//  SZProxyViewController.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZProxyViewController.h"

// 基本代码
#import "SZGirl.h"
#import "SZProxy.h"
#import "SZPursuit.h"

// 事例代码
#import "SZChildren.h"
#import "SZNurse.h"
#import "SZNanny.h"

/*
 • 代理模式是为其他对象提供一种代理以控制对这个对象的访问。
 • 代理模式应用
 1.远程代理，为一个对象在不同的地址空间提供局部代表，这样可以隐藏一个对象存在于不同地址空间的事实。
 2.虚拟代理，根据需要创建开销很大的对象，通过它来存放实例化需要很长时间的真实对象。
 3.安全代理，用来控制真实对象访问时的权限。
 4.智能指引，是指当调用真实的对象时，代理处理另外一些事（KVO）。
 代理模式其实就是在访问对象时引入一定程度的间接性，因为这种间接性可以附加多种用途。
 */

@interface SZProxyViewController ()

@end

@implementation SZProxyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"代理模式";
    
    self.lblTips.text = @"点击屏幕测试！！！";
    
    self.lblResult.text = @"请注意观察控制台输出！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testProxy:[self getRandomNumber:0 to:1]];
}

- (void)testProxy:(NSInteger)codeType
{
    if (codeType == 0) {
        
        SZGirl *girl = [[SZGirl alloc] init];
        
        girl.name = @"綺麗な女";
        
        SZProxy *proxy = [[SZProxy alloc] initWithGirl:girl];
        
        SZPursuit *pursuit = [[SZPursuit alloc] initWithGirl:girl];
        
        [pursuit setupDelegate:proxy];
        
        /*
         礼物实际 是由 Pursuit 送给 girl ，但是经转 proxy 之手送的，而不是亲自送
         */
        
        NSInteger giftType = [self getRandomNumber:0 to:2];
        
        switch (giftType) {
                
            case 0:
                
                [pursuit doGiveFlowers];
                
                break;
                
            case 1:
                
                [pursuit doGiveFlowers];
                [pursuit doGiveChocolate];
                
                break;
                
            case 2:
                
                [pursuit doGiveFlowers];
                [pursuit doGiveChocolate];
                [pursuit doGiveDoll];
                
                break;
                
            default:
                
                break;
        }
        
    } else {
        
        [self childrenTest:[self getRandomNumber:0 to:1]];
    }
}

- (void)childrenTest:(NSInteger)childrenProxyType
{
    SZChildren *children = [SZChildren new];
    
    // 由于 ARC 使用 weak 修饰 delegate，所以 代理应该与被代理处于同一作用域，不然使用代理时，代理就可能不存在
    // 例如：nurse 放在 判断语句内，则在调用代理时，代理已经被释放，无法调起代理
    SZNurse *nurse = [SZNurse new];
    
    SZNanny *nanny = [SZNanny new];
    
    if (childrenProxyType == 0) {
        
        [children setupDelegate:nurse];
        
    } else {

        [children setupDelegate:nanny];
    }
    
    NSInteger childrenBehaveType = [self getRandomNumber:0 to:1];
    
    if (childrenBehaveType == 0) {
        
        [children startWash];
        
    } else {
        
        [children startWash];
        [children startPlay];
    }
}

@end
