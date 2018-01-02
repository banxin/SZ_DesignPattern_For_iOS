//
//  SZConcreteCompany.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/26.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZConcreteCompany.h"

@interface SZConcreteCompany ()

@property (nonatomic, strong) NSMutableArray *childList;

@end

@implementation SZConcreteCompany

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
    [self.childList addObject:component];
}

- (void)remove:(id<SZCompanyProtocol>)component
{
    [self.childList removeObject:component];
}

- (NSString *)display:(NSInteger)depth
{
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@""];
    
    if (depth == 0 || depth == 1) {
        
        [showStr appendString:[NSString stringWithFormat:@"%@\n", [NSString stringWithFormat:@"-%@", self.name]]];
        
    } else {
        
        NSMutableArray *ary = [NSMutableArray arrayWithCapacity:depth];
        
        for (int i = 0; i < depth; i++) {
            
            [ary addObject:@"-"];
        }
        
        [showStr appendString:[NSString stringWithFormat:@"%@\n", [NSString stringWithFormat:@"%@%@", [ary componentsJoinedByString:@""], self.name]]];
    }
    
    [self.childList enumerateObjectsUsingBlock:^(id<SZCompanyProtocol> component, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx + 1 == self.childList.count) {
            
            [showStr appendString:[NSString stringWithFormat:@"%@", [component display:depth + 2]]];
            
        } else {
            
            [showStr appendString:[NSString stringWithFormat:@"%@\n", [component display:depth + 2]]];
        }
    }];
    
    return showStr;
}

- (NSString *)lineOfDuty
{
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@""];
    
    [self.childList enumerateObjectsUsingBlock:^(id<SZCompanyProtocol> component, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx + 1 == self.childList.count) {
            
            [showStr appendString:[NSString stringWithFormat:@"%@", [component lineOfDuty]]];
            
        } else {
            
            [showStr appendString:[NSString stringWithFormat:@"%@\n", [component lineOfDuty]]];
        }
    }];
    
    return showStr;
}

#pragma mark - laze load

- (NSMutableArray *)childList
{
    if (!_childList) {
        
        _childList = [NSMutableArray arrayWithCapacity:3];
    }
    
    return _childList;
}

@end
