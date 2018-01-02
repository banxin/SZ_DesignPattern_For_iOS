//
//  SZHRDepartment.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/26.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZHRDepartment.h"

@implementation SZHRDepartment

@synthesize name = _name;

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        
        self.name = name;
    }
    
    return self;
}

- (void)add:(id<SZCompanyProtocol>)component
{
    
}

- (void)remove:(id<SZCompanyProtocol>)component
{
    
}

- (NSString *)display:(NSInteger)depth
{
    if (depth == 0 || depth == 1) {
        
        return [NSString stringWithFormat:@"-%@", self.name];
        
    } else {
        
        NSMutableArray *ary = [NSMutableArray arrayWithCapacity:depth];
        
        for (int i = 0; i < depth; i++) {
            
            [ary addObject:@"-"];
        }
        
        return [NSString stringWithFormat:@"%@%@", [ary componentsJoinedByString:@""], self.name];
    }
}

- (NSString *)lineOfDuty
{
    return [NSString stringWithFormat:@"%@：员工招聘培训管理", self.name];
}

@end
