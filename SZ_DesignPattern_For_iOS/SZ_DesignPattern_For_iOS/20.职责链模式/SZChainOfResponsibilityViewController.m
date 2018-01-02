//
//  SZChainOfResponsibilityViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZChainOfResponsibilityViewController.h"

// 基本代码
#import "SZHandlerProtocol.h"
#import "SZConcreteHandler1.h"
#import "SZConcreteHandler2.h"
#import "SZConcreteHandler3.h"

// 事例代码
#import "SZRequest.h"
#import "SZCommonManger.h"
#import "SZMajordomo.h"
#import "SZGeneralManager.h"

@interface SZChainOfResponsibilityViewController ()

@end

@implementation SZChainOfResponsibilityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"职责链模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testBasic] : [self testReflex];
}

- (void)testBasic
{
    id<SZHandlerProtocol> handler1 = [SZConcreteHandler1 new];
    id<SZHandlerProtocol> handler2 = [SZConcreteHandler2 new];
    id<SZHandlerProtocol> handler3 = [SZConcreteHandler3 new];
    
    handler1.handler = handler2;
    handler2.handler = handler3;
    
    NSArray *requests = @[@-1, @2, @5, @14, @22, @18, @3, @27, @20, @33];
    
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@"基本代码测试：\n\n"];
    
    for (NSNumber *request in requests) {
        
        [showStr appendString:[NSString stringWithFormat:@"%@\n", [handler1 handlerRequest:request.integerValue]]];
    }
    
    self.lblResult.text = showStr;
}

- (void)testReflex
{
    SZCommonManger *manager = [SZCommonManger new];
    
    manager.name = @"经理";
    
    SZMajordomo *majordomo = [SZMajordomo new];
    
    majordomo.name = @"总监";
    
    SZGeneralManager *generalManager = [SZGeneralManager new];
    
    generalManager.name = @"总经理";
    
    manager.manager = majordomo;
    majordomo.manager = generalManager;
    
    SZRequest *request1 = [SZRequest new];
    
    request1.requestType = @"请假";
    request1.requestContent = @"XX 请假";
    request1.number = 1;
    
    SZRequest *request2 = [SZRequest new];
    
    request2.requestType = @"请假";
    request2.requestContent = @"XX 请假";
    request2.number = 4;
    
    SZRequest *request3 = [SZRequest new];
    
    request3.requestType = @"加薪";
    request3.requestContent = @"XX 请求加薪";
    request3.number = 500;
    
    SZRequest *request4 = [SZRequest new];
    
    request4.requestType = @"加薪";
    request4.requestContent = @"XX 请求加薪";
    request4.number = 1000;
    
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@"事例代码测试：\n\n"];
    
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [manager requestApplications:request1]]];
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [manager requestApplications:request2]]];
    [showStr appendString:[NSString stringWithFormat:@"%@\n", [manager requestApplications:request3]]];
    [showStr appendString:[manager requestApplications:request4]];
    
    self.lblResult.text = showStr;
}

@end
