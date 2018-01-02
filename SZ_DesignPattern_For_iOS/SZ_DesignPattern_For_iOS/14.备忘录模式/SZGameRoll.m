//
//  SZGameRoll.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZGameRoll.h"
#import "SZRollStateMemento.h"

@interface SZGameRoll ()

@property (nonatomic, assign) NSInteger vitality;
@property (nonatomic, assign) NSInteger attack;
@property (nonatomic, assign) NSInteger defence;

@end

@implementation SZGameRoll

- (void)initState
{
    self.vitality = 100;
    self.attack = 100;
    self.defence = 100;
}

- (SZRollStateMemento *)saveState
{
    SZRollStateMemento *memento = [SZRollStateMemento new];
    
    memento.vitality = self.vitality;
    memento.attack = self.attack;
    memento.defence = self.defence;
    
    return memento;
}

- (void)recoverState:(SZRollStateMemento *)memento
{
    self.vitality = memento.vitality;
    self.attack = memento.attack;
    self.defence = memento.defence;
}

- (void)fight
{
    self.vitality = 0;
    self.attack = 0;
    self.defence = 0;
}

- (NSString *)stateDisplay
{
    return [NSString stringWithFormat:@"状态->生命：%zd，攻击：%zd，防御：%zd", self.vitality, self.attack, self.defence];
}

@end
