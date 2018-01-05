//
//  SZObjectStructure.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZObjectStructure.h"
#import "SZElementProtocol.h"
#import "SZVistorProtocol.h"

/*
 SZObjectStructure类，能枚举 element 的元素，可以提供一个高层接口以允许访问者访问它的元素
 */
@interface SZObjectStructure ()

@property (nonatomic, strong) NSMutableArray *elements;

@end

@implementation SZObjectStructure

- (void)attach:(id<SZElementProtocol>)element
{
    [self.elements addObject:element];
}

- (void)detach:(id<SZElementProtocol>)element
{
    [self.elements removeObject:element];
}

- (NSString *)accept:(id<SZVistorProtocol>)vistor
{
    if (!self.elements) {
        
        return @"无数据！！！";
    }
    
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@""];
    
    for (id<SZElementProtocol>element in self.elements) {
        
        [showStr appendString:[NSString stringWithFormat:@"%@\n", [element accept:vistor]]];
    }
    
    return showStr;
}

#pragma mark - lazy load

- (NSMutableArray *)elements
{
    if (!_elements) {
        
        _elements = [NSMutableArray arrayWithCapacity:1];
    }
    
    return _elements;
}

@end
