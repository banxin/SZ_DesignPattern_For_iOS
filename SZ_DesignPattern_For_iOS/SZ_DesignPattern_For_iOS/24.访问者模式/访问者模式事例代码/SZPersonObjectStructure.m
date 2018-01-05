//
//  SZPersonObjectStructure.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZPersonObjectStructure.h"
#import "SZHumanActionProtocol.h"
#import "SZPersonProtocol.h"

@interface SZPersonObjectStructure ()

@property (nonatomic, strong) NSMutableArray *elements;

@end

@implementation SZPersonObjectStructure

- (void)attach:(id<SZPersonProtocol>)element
{
    [self.elements addObject:element];
}

- (void)detach:(id<SZPersonProtocol>)element
{
    [self.elements removeObject:element];
}

- (NSString *)accept:(id<SZHumanActionProtocol>)vistor
{
    if (!self.elements) {
        
        return @"无数据！！！";
    }
    
    NSMutableString *showStr = [[NSMutableString alloc] initWithString:@""];
    
    for (id<SZPersonProtocol>element in self.elements) {
        
        [showStr appendString:[NSString stringWithFormat:@"%@\n", [element fetchAction:vistor]]];
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
