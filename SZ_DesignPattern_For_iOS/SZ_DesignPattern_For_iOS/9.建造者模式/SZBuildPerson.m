//
//  SZBuildPerson.m
//  iOS-DesignPattern
//
//  Created by yanl on 2017/12/22.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZBuildPerson.h"
#import "SZBulidHead.h"
#import "SZBuildBody.h"
#import "SZBuildArm.h"
#import "SZBuildLeg.h"

@interface SZBuildPerson ()

@property (nonatomic, strong) SZBulidHead *headBuild;

@property (nonatomic, strong) SZBuildBody *bodyBuild;

@property (nonatomic, strong) SZBuildArm *armBuild;

@property (nonatomic, strong) SZBuildLeg *legBuild;

@end

@implementation SZBuildPerson

- (instancetype)init
{
    if (self = [super init]) {
        
        _headBuild = [SZBulidHead new];
        _bodyBuild = [SZBuildBody new];
        _armBuild = [SZBuildArm new];
        _legBuild = [SZBuildLeg new];
    }
    
    return self;
}

- (NSString *)buildHead
{
    return [_headBuild buildHead];
}

- (NSString *)buildBody
{
    return [_bodyBuild buildBody];
}

- (NSString *)buildLeftArm
{
    return [_armBuild buildArm:SZBuildArmTypeLeft];
}

- (NSString *)buildRightArm
{
    return [_armBuild buildArm:SZBuildArmTypeRight];
}

- (NSString *)buildLeftLeg
{
    return [_legBuild buildLeg:SZBuildLegTypeLeft];
}

- (NSString *)buildRightLeg
{
    return [_legBuild buildLeg:SZBuildLegTypeRight];
}

- (NSString *)buildPerson
{
    return [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n", [self buildHead], [self buildBody], [self buildLeftArm], [self buildRightArm], [self buildLeftLeg], [self buildRightLeg]];
}

@end
