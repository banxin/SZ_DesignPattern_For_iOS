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
