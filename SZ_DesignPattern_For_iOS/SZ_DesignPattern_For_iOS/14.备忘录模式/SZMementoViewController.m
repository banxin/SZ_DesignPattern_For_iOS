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

/*
 从打游戏存档引入问题。
 需求，实现一个打BOSS前存档，打完BOSS可以恢复到存档时的状态的场景。
 版本1
 游戏角色类有生命、攻击、防御三种属性，首先初始化属性，然后打BOSS前保存属性，打BOSS后角色属性损耗，然后通过保存的角色对象恢复之前的状态。
 问题：将游戏角色的实现细节都暴露给客户端，客户端的职责过大，而且当给角色增加新属性时就需要修改多处。
 版本2
 游戏角色类有保存状态、恢复状态及相关属性，角色状态备忘录类有角色的属性和对应set方法，角色状态管理类有备忘录的属性用来保存备忘录。这样就可以将具体细节封闭起来。
 
 备忘录模式
 • 备忘录是在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样以后就可将该对象恢复到原先保存的状态。
 • 就相当于将要保存的细节封装在备忘录中了，当哪一天需要更改保存的细节时也不会影响客户端。
 备忘录模式比较适用于功能比较复杂的，但是需要维护或记录属性历史的类，或者需要保存的属性只是众多属性中的一小部分，这样发起人就可以通过管理者存储的备忘录对象恢复之前的状态。
 */

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
