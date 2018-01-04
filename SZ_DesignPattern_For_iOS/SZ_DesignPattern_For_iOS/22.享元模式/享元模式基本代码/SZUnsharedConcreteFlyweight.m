//
//  SZUnsharedConcreteFlyweight.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZUnsharedConcreteFlyweight.h"

@implementation SZUnsharedConcreteFlyweight

- (NSString *)operation:(NSInteger)extrinsicstate
{
    return [NSString stringWithFormat:@"不共享的具体 UnsharedConcreteFlyweight : %zd", extrinsicstate];
}


@end
