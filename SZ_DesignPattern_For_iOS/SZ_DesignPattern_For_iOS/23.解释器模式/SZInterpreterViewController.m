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

/*
 解释器模式的实际运用如正则语法、XML、JSON等等。
 
 解释器模式
 • 解释器模式，给定一个语言，定义它的文法中的一种表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。
 • 如果特定类型的问题发生的频率足够高，那么可能有值得将该问题的各个实例表述为一个简单语言中的句子。这样就可以构建一个解释器，该解释器通过解释这些句子来解决该问题。
 • 当有一个语言需要解释执行，并且你可将该语言中的句子表示为一个抽象语法树时，可使用解释器模式。
 */

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
