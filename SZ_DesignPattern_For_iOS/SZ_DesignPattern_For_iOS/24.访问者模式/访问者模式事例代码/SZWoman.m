//
//  SZWoman.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZWoman.h"

@implementation SZWoman

- (NSString *)fetchAction:(id<SZHumanActionProtocol>)action
{
    return [action fetchWomanConclusion:self];
}

@end
