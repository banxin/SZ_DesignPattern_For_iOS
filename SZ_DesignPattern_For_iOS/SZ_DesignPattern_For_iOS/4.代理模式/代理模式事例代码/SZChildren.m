//
//  SZChildren.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/20.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZChildren.h"

@interface SZChildren ()

/*
 // 这里可以使用多态技术实现，因为保姆，护士有共同的父类NSObject,但是这里不使用这种方式，而是使用id类型
 // 但是我们还需要为这个类型添加一些方法，这里就用到了协议
 // 这个代理对象必须遵从ChildrenDelegate协议
 */

// 这个变量就是小孩的代理对象 ？？ 疑问：存不住值
@property (nonatomic, weak) id<SZChildrenDelegate> delegate;

@end

@implementation SZChildren

- (void)setupDelegate:(id)delegate
{
    self.delegate = delegate;
}

- (void)startWash
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(wash)]) {

        [self.delegate wash];
    }
}

- (void)startPlay
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(play)]) {

        [self.delegate play];
    }
}

@end
