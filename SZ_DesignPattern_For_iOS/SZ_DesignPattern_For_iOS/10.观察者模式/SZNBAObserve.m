//
//  SZNBAObserve.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/23.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZNBAObserve.h"

@implementation SZNBAObserve

- (NSString *)closeNBA
{
    return [self update];
}

- (NSString *)update
{
    return [NSString stringWithFormat:@"%@, 看NBA的，赶紧好好干活！！！", self.name];
}

@end
