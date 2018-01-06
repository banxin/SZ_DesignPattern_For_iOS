//
//  SZIteratorViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/27.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZIteratorViewController.h"

/*
 迭代器模式现在基本各种高级语言中都对其进行了封装，如for-in、enumerate等。
 
 迭代器模式
 • 迭代器模式是提供一种方法顺序访问一个聚合对象中各种元素，而又不暴露该对象的内部表示。
 • 当你需要访问一个聚合对象，而且不管这些对象是什么都需要遍历的时候，就应该考虑迭代器模式。需要对聚合有多重遍历模式时，可以考虑迭代器模式。也就是说，为便利不同的聚集结构提供如开始、下一个、是否结束、当前哪一项等统一的接口。
 */

@interface SZIteratorViewController ()

@end

@implementation SZIteratorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"迭代器模式";
    
    self.lblTips.text = @"该模式在OC中，集合类已完美实现，该模式无需代码演示，应该都会使！！！";
}

@end
