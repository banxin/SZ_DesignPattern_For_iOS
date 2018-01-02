//
//  SZCompanyProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2017/12/26.
//  Copyright © 2017年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SZCompanyProtocol <NSObject>

@property (nonatomic, copy) NSString *name;

- (void)add:(id<SZCompanyProtocol>)component;

- (void)remove:(id<SZCompanyProtocol>)component;

- (NSString *)display:(NSInteger)depth;

- (NSString *)lineOfDuty;

@end
