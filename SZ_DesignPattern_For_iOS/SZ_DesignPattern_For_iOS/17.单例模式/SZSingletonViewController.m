//
//  SZSingletonViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/27.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSingletonViewController.h"
#import "SZSingleton.h"

@interface SZSingletonViewController ()

@end

@implementation SZSingletonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"单例模式";
    
    self.lblTips.text = @"很常用的模式！！！这里测试下一个单例的两份实例的地址！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SZSingleton *singleton1 = [SZSingleton shareInstance];
    
    SZSingleton *singleton2 = [SZSingleton shareInstance];
    
    self.lblResult.text = [NSString stringWithFormat:@"singleton1: %p\nsingleton2: %p", singleton1, singleton2];
}

@end
