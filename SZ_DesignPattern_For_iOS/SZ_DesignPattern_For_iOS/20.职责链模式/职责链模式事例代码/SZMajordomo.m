//
//  SZMajordomo.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZMajordomo.h"

@implementation SZMajordomo

@synthesize name = _name;
@synthesize manager = _manager;

- (NSString *)requestApplications:(SZRequest *)request
{
    // 总监的权限：可准许部下一周内的假期
    if ([request.requestType isEqualToString:@"请假"] && request.number <= 5) {
        
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
