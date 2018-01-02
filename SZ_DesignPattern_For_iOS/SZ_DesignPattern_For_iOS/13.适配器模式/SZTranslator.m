//
//  SZTranslator.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/25.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import "SZTranslator.h"
#import "SZCNCenter.h"

@interface SZTranslator ()

@property (nonatomic, strong) SZCNCenter *cnCenter;

@end

@implementation SZTranslator

@synthesize name = _name;

- (instancetype)init
{
    if (self == [super init]) {
        
        self.cnCenter = [SZCNCenter new];
    }
    
    return self;
}

- (void)setName:(NSString *)name
{
    _name = name;
    
    _cnCenter.name = name;
}

- (NSString *)attack
{
    return [NSString stringWithFormat:@"中锋，%@, 进攻！！！", self.name];
}

- (NSString *)defence
{
    return [NSString stringWithFormat:@"中锋，%@, 防守！！！", self.name];
}

@end
