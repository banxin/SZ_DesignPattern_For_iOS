//
//  SZUniteNationsSecurityCouncil.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZUniteNationsSecurityCouncil.h"

@implementation SZUniteNationsSecurityCouncil

- (NSString *)declare:(NSString *)message country:(id<SZCountryProtocol>)country
{
    if ([country isKindOfClass:[SZUSA class]]) {
        
        return [self.iraq getMessage:message];
        
    } else if ([country isKindOfClass:[SZIraq class]]) {
        
        return [self.usa getMessage:message];
    }
    
    return @"无法识别的声明！！！";
}

@end
