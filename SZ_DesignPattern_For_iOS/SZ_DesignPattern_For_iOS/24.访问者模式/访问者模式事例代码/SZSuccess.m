//
//  SZSuccess.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZSuccess.h"

@implementation SZSuccess

- (NSString *)fetchManConclusion:(SZMan *)man
{
    return @"Man Success 时，背后多半有个伟大的女人！";
}

- (NSString *)fetchWomanConclusion:(SZWoman *)woman
{
    return @"Woman Success 时，背后多半有个不成功的男人！";
}

@end
