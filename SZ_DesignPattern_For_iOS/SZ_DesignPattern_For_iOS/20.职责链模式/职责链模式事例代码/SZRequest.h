//
//  SZRequest.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/2.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZRequest : NSObject

@property (nonatomic, strong) NSString *requestType;

@property (nonatomic, strong) NSString *requestContent;

@property (nonatomic, assign) NSInteger number;

@end
