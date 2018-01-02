//
//  SZProxy.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZProxy.h"
#import "SZGirl.h"
#import "SZPursuit.h"

@interface SZProxy ()

@property (nonatomic, strong) SZPursuit *pursuit;

@property (nonatomic, strong) SZGirl *girl;

@end

@implementation SZProxy

- (instancetype)initWithGirl:(SZGirl *)girl
{
    if (self = [super init]) {
        
        self.girl = girl;
        
        self.pursuit = [[SZPursuit alloc] initWithGirl:girl];
    }
    
    return self;
}

#pragma mark - SZGiveGift

// 更符合OC写法的基本代码
- (void)giveDoll
{
    NSLog(@"%@: Proxy帮我送你洋娃娃，望笑纳！", self.girl.name);
}

- (void)giveFlowers
{
    NSLog(@"%@: Proxy帮我送你花花，望笑纳！", self.girl.name);
}

- (void)giveChocolate
{
    NSLog(@"%@: Proxy帮我送你巧克力，望笑纳！", self.girl.name);
}

// 原始操作代码

//- (void)giveDoll
//{
//    [self.pursuit giveDoll];
//}
//
//- (void)giveFlowers
//{
//    [self.pursuit giveFlowers];
//}
//
//- (void)giveChocolate
//{
//    [self.pursuit giveChocolate];
//}

@end
