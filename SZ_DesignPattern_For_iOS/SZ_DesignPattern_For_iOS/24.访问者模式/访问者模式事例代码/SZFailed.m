//
//  SZFailed.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZFailed.h"

@implementation SZFailed

- (NSString *)fetchManConclusion:(SZMan *)man
{
    return @"Man Failed 时，闷头喝酒，谁也不用劝！";
}

- (NSString *)fetchWomanConclusion:(SZWoman *)woman
{
    return @"Woman Failed 时，眼泪汪汪，谁也劝不了！";
}

@end
