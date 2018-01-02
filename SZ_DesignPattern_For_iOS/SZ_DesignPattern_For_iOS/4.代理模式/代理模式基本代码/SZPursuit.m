//
//  SZPursuit.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/19.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZPursuit.h"
#import "SZGirl.h"

@interface SZPursuit ()

@property (nonatomic, strong) SZGirl *girl;

@property (nonatomic, weak)   id<SZGiveGift> delegate;

@end

@implementation SZPursuit

- (instancetype)initWithGirl:(SZGirl *)girl
{
    if (self = [super init]) {
        
        self.girl = girl;
    }
    
    return self;
}

#pragma mark - public method

- (void)setupDelegate:(id<SZGiveGift>) delegate
{
    self.delegate = delegate;
}

- (void)doGiveDoll;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(giveDoll)]) {
        
        [self.delegate giveDoll];
    }
}

- (void)doGiveFlowers
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(doGiveFlowers)]) {
        
        [self.delegate giveFlowers];
    }
}

- (void)doGiveChocolate
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(doGiveChocolate)]) {
        
        [self.delegate giveChocolate];
    }
}

#pragma mark - SZGiveGift

- (void)giveDoll
{
    NSLog(@"%@: 送你洋娃娃，望笑纳！", self.girl.name);
}

- (void)giveFlowers
{
    NSLog(@"%@: 送你花花，望笑纳！", self.girl.name);
}

- (void)giveChocolate
{
    NSLog(@"%@: 送你巧克力，望笑纳！", self.girl.name);
}

@end
