//
//  SZConcreteFlyweight.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZConcreteFlyweight.h"

@implementation SZConcreteFlyweight

- (NSString *)operation:(NSInteger)extrinsicstate
{
    return [NSString stringWithFormat:@"具体 Flyweight : %zd", extrinsicstate];
}

@end
