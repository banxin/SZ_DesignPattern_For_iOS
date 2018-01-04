//
//  SZUSA.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZCountryProtocol.h"

@interface SZUSA : NSObject<SZCountryProtocol>

- (NSString *)waring:(NSString *)msg;

@end
