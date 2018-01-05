//
//  SZVisitorViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZVisitorViewController.h"

// 基本代码
#import "SZConcreteVistor1.h"
#import "SZConcreteVistor2.h"
#import "SZObjectStructure.h"
#import "SZConcreteElementA.h"
#import "SZConcreteElementB.h"

// 事例代码
#import "SZSuccess.h"
#import "SZFailed.h"
#import "SZAmativeness.h"
#import "SZMan.h"
#import "SZWoman.h"
#import "SZPersonObjectStructure.h"

@interface SZVisitorViewController ()

@end

@implementation SZVisitorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"访问者模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getRandomNumber:0 to:1] == 0 ? [self testBasic] : [self testReflex];
}

- (void)testBasic
{
    SZObjectStructure *objectStructure = [SZObjectStructure new];
    
    [objectStructure attach:[SZConcreteElementA new]];
    [objectStructure attach:[SZConcreteElementB new]];
    
    SZConcreteVistor1 *vistor1 = [SZConcreteVistor1 new];
    SZConcreteVistor2 *vistor2 = [SZConcreteVistor2 new];
    
    self.lblResult.text = [NSString stringWithFormat:@"基本代码测试：\n\nVistor1：\n%@\nVistor2：\n%@", [objectStructure accept:vistor1], [objectStructure accept:vistor2]];
}

- (void)testReflex
{
    SZPersonObjectStructure *personObjectStructure = [SZPersonObjectStructure new];
    
    [personObjectStructure attach:[SZMan new]];
    [personObjectStructure attach:[SZWoman new]];
    
    SZSuccess *success = [SZSuccess new];
    SZFailed *failed = [SZFailed new];
    SZAmativeness *amativeness = [SZAmativeness new];
    
    self.lblResult.text = [NSString stringWithFormat:@"事例代码测试：\n\nSuccess：\n%@\nFailed：\n%@\nAmativeness：\n%@", [personObjectStructure accept:success], [personObjectStructure accept:failed], [personObjectStructure accept:amativeness]];
}

@end
