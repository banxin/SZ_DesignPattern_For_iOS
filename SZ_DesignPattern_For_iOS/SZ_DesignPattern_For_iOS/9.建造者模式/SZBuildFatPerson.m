//
//  SZBuildFatPerson.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZBuildFatPerson.h"

@implementation SZBuildFatPerson

- (NSString *)buildHead
{
    return [NSString stringWithFormat:@"胖人：%@", [super buildHead]];
}

- (NSString *)buildBody
{
    return [NSString stringWithFormat:@"胖人：%@", [super buildBody]];
}

- (NSString *)buildLeftArm
{
    return [NSString stringWithFormat:@"胖人：%@", [super buildLeftArm]];
}

- (NSString *)buildRightArm
{
    return [NSString stringWithFormat:@"胖人：%@", [super buildRightArm]];
}

- (NSString *)buildLeftLeg
{
    return [NSString stringWithFormat:@"胖人：%@", [super buildLeftLeg]];
}

- (NSString *)buildRightLeg
{
    return [NSString stringWithFormat:@"胖人：%@", [super buildRightLeg]];
}

- (NSString *)buildPerson
{    
    return [NSString stringWithFormat:@"建造胖人，过程如下：\n%@\n%@\n%@\n%@\n%@\n%@\n", [self buildHead], [self buildBody], [self buildLeftArm], [self buildRightArm], [self buildLeftLeg], [self buildRightLeg]];
}

@end
