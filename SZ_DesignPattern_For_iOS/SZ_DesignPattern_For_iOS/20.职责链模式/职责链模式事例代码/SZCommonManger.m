//
//  SZCommonManger.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZCommonManger.h"

@implementation SZCommonManger

@synthesize name = _name;
@synthesize manager = _manager;

- (NSString *)requestApplications:(SZRequest *)request
{
    // 经理的权限：可准许部下两天内的假期
    if ([request.requestType isEqualToString:@"请假"] && request.number <= 2) {
        
        return [NSString stringWithFormat:@"%@: %@ %@ 数量： %zd 被批准！", _name, request.requestContent, request.requestType, request.number];
        
    } else {
        
        if (_manager) {
            
            return [_manager requestApplications:request];
            
        } else {
            
            return @"无效的申请！";
        }
    }
}

@end
