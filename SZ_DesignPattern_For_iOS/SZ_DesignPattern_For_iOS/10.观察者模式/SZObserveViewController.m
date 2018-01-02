//
//  SZObserveViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZObserveViewController.h"
#import "SZStockObserver.h"
#import "SZSecretary.h"
#import "SZNBAObserve.h"
#import "SZBoss.h"

@interface SZObserveViewController ()

@end

@implementation SZObserveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"观察者模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testObserve:[self getRandomNumber:0 to:1]];
}

/*
 实现如书中说的事件委托，一个特殊的类，能搭载多个不同的类的不同个方法执行，使用了block回调来实现
 */
- (void)testObserve:(NSInteger)type
{
    SZStockObserver *observeA = [SZStockObserver new];
    
    observeA.name = @"observeA";

    SZNBAObserve *observeB = [SZNBAObserve new];
    
    observeB.name = @"observeB";
    
    // 由于使用block，无论多少个都可以通知到位，也避免了传统方法中的添加和删除
    
    id<SZSubject> subject;
    
    if (type == 0) {

        // 前台
        subject = [SZSecretary new];
        
    } else {
        
        // 老板
        subject = [SZBoss new];
    }
    
    __weak typeof(self)    weakSelf    = self;
    __weak typeof(subject) weakSubject = subject;
    
    subject.SZSubjectCallBack = ^{
        
        __strong typeof(weakSelf)    strongSelf    = weakSelf;
        __strong typeof(weakSubject) strongSubject = weakSubject;
        
        strongSelf.lblResult.text = [NSString stringWithFormat:@"%@\n%@\n%@\n", [strongSubject stateStr], [observeA closeStock], [observeB closeNBA]];
    };
    
    // 通知两个员工
    [subject notify];
}

@end
