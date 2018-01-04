//
//  SZWebsiteFactory.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZWebsiteFactory.h"
#import "SZConcreteWebsite.h"

@interface SZWebsiteFactory ()

@property (nonatomic, strong) NSMutableDictionary *webs;

@end

@implementation SZWebsiteFactory

- (id<SZWebsiteProtocol>)fetchWebsite:(NSString *)key
{
    if (![[self.webs allKeys] containsObject:key]) {
        
        SZConcreteWebsite *websit = [SZConcreteWebsite new];
        
        websit.name = key;
        
        [self.webs setObject:websit forKey:key];
        
        return websit;
    }
    
    return (SZConcreteWebsite *)self.webs[key];
}

- (NSUInteger)fetchWebsiteCount
{
    return self.webs.count;
}

#pragma mark - lazy load

- (NSMutableDictionary *)webs
{
    if (!_webs) {
        
        _webs = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    
    return _webs;
}

@end
