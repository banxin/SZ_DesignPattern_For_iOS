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

/*
 由一个问题管理者无权解决层层上报引入问题。
 
 职责链模式
 感觉好像之前的状态模式，将if-else分拆成子类的链条（链表？）。
 • 职责链模式是使多个对象都有机会处理请求，从而避免请求的发送者和接收者之间的耦合关系，将这个对象连成一条链，并沿着这条链传递该请求，直到有一个对象处理它位置。
 • 请求者并不知道是当中的哪一个对象最终处理这个请求，这样的系统的更改可以在不影响客户端的情况下动态地重新组织和分配责任。接收者和发送者都没有对方的明确信息，而且链中的对象自己不知道链的结构，结果就是职责链可以简化对象的相互连接，他们仅需保持一个指向其后继者的引用，而不需保持它所有的候选接受者的引用，这样就大大的降低了耦合度。
 */

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
