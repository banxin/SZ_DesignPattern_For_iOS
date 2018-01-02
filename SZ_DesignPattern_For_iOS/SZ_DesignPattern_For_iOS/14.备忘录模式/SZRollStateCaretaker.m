//
//  SZRollStateCaretaker.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZRollStateCaretaker.h"
#import "SZRollStateMemento.h"

@interface SZRollStateCaretaker ()

@property (nonatomic, strong) SZRollStateMemento *memento;

@end

@implementation SZRollStateCaretaker

- (void)backupRollState:(SZRollStateMemento *)rollState
{
    self.memento = rollState;
}

- (SZRollStateMemento *)getRollState
{
    return _memento;
}

@end
