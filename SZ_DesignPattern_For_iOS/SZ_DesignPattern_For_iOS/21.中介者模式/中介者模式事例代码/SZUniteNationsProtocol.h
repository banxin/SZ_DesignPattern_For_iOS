//
//  SZUniteNationsProtocol.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZCountryProtocol.h"

@protocol SZUniteNationsProtocol <NSObject>

- (NSString *)declare:(NSString *)message country:(id<SZCountryProtocol>)country;

@end
