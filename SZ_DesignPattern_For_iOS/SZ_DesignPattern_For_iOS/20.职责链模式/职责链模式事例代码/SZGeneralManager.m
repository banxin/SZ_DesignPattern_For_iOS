//
//  SZGeneralManager.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZGeneralManager.h"

@implementation SZGeneralManager

@synthesize name = _name;
@synthesize manager = _manager;

- (NSString *)requestApplications:(SZRequest *)request
{
    // 总经理的权限：全部需要处理
    // 任意天数的请假
    if ([request.requestType isEqualToString:@"请假"]) {
        
        return [NSString stringWithFormat:@"%@: %@ %@ 数量： %zd 被批准！", _name, request.requestContent, request.requestType, request.number];
        
    } else if ([request.requestType isEqualToString:@"加薪"]) {
        
        if (request.number <= 500) {
            
            return [NSString stringWithFormat:@"%@: %@ %@ 数量： %zd 被批准！", _name, request.requestContent, request.requestType, request.number];
            
        } else {
            
            return [NSString stringWithFormat:@"%@: %@ %@ 数量： %zd 再说吧！", _name, request.requestContent, request.requestType, request.number];
        }
        
    } else {
        
       return @"无效的申请！";
    }
}

@end
