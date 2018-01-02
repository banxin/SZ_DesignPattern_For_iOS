//
//  SZMementoViewController.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZMementoViewController.h"
#import "SZGameRoll.h"
#import "SZRollStateCaretaker.h"

@interface SZMementoViewController ()

@end

@implementation SZMementoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"备忘录模式";
    
    self.lblTips.text = @"点击屏幕测试哦！！！";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testMemento];
}

- (void)testMemento
{
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@""];
    
    // 大战 BOSS 前
    SZGameRoll *roll = [SZGameRoll new];
    
    [roll initState];
    
    [showStr appendString:[NSString stringWithFormat:@"大战 BOSS 前:\n%@\n", [roll stateDisplay]]];
    
    // 保存进度
    SZRollStateCaretaker *caretaker = [SZRollStateCaretaker new];
    
    [caretaker backupRollState:[roll saveState]];
    
    // 大战 BOSS
    [roll fight];
    
    [showStr appendString:[NSString stringWithFormat:@"大战 BOSS 后:\n%@\n", [roll stateDisplay]]];
    
    // 恢复最初的状态
    [roll recoverState:[caretaker getRollState]];
    
    [showStr appendString:[NSString stringWithFormat:@"恢复 后:\n%@\n", [roll stateDisplay]]];
    
    self.lblResult.text = showStr;
}

@end



















