//
//  SZInterpreterViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZInterpreterViewController.h"

// 基本代码
#import "SZAbstractExpressionProtocol.h"
#import "SZContext.h"
#import "SZTerminalExpression.h"
#import "SZNonTerminalExpression.h"

// 事例代码

@interface SZInterpreterViewController ()

@end

@implementation SZInterpreterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"解释器模式模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testBasic];
}

- (void)testBasic
{
    SZContext *context = [SZContext new];
    
    context.input = @"input";
    context.output = @"output";
    
    NSArray *ary = @[[SZTerminalExpression new], [SZTerminalExpression new], [SZNonTerminalExpression new], [SZTerminalExpression new]];
    
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@"代码测试：\n\n"];
    
    for (id<SZAbstractExpressionProtocol> expression in ary) {
        
        [showStr appendString:[NSString stringWithFormat:@"%@\n", [expression interpret:context]]];
    }
    
    self.lblResult.text = showStr;
}

@end
