//
//  SZFlyweightFactory.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZFlyweightFactory.h"
#import "SZConcreteFlyweight.h"

@interface SZFlyweightFactory ()

@property (nonatomic, strong) NSDictionary *flyweights;

@end

@implementation SZFlyweightFactory

- (instancetype)init
{
    if (self = [super init]) {
        
        self.flyweights = @{@"X" : [SZConcreteFlyweight new], @"Y" : [SZConcreteFlyweight new], @"Z" : [SZConcreteFlyweight new]};
    }
    
    return self;
}

- (id<SZFlyweightProtocol>)fetchFlyweight:(NSString *)key
{
    return (SZConcreteFlyweight *)self.flyweights[key];
}

@end
