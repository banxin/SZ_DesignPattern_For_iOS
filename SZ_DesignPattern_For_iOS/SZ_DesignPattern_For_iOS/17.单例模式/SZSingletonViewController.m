//
//  SZSingletonViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/27.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZSingletonViewController.h"
#import "SZSingleton.h"

/*
 这个太熟悉了！
 
 • 单例（Singleton）模式可以保证一个类仅有一个实例，并提供一个访问它的全局访问点。
 • 通常我们可以让一个全局变量使得一个对象被访问，但不能防止你实例化多个对象，一个最好的办法就是，让类自身负责保存他的唯一实例，这个类可以保证没有其他实例可以被创建，并且可以提供一个访问该实例的方法。
 • 单例模式因为单例类封装它的唯一实例，这样它可以严格地控制客户怎样访问它和何时访问它，简单地说就是对唯一实例的受控访问。
 • 多线程的单例，就是在多线程的程序中，多个线程同时访问 singleton类调用单例创建方法是可能会创建多个实例的。所以需要加锁。
 */

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
