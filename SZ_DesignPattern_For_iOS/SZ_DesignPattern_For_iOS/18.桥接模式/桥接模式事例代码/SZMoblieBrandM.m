//
//  SZMoblieBrandM.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/28.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZMoblieBrandM.h"

@implementation SZMoblieBrandM

@synthesize mobileSoft = _mobileSoft;

- (NSString *)run
{
    return [NSString stringWithFormat:@"手机品牌M：%@", [_mobileSoft run]];
}

@end
