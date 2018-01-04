//
//  SZUniteNationsSecurityCouncil.h
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/4.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZUniteNationsProtocol.h"
#import "SZUSA.h"
#import "SZIraq.h"

@interface SZUniteNationsSecurityCouncil : NSObject<SZUniteNationsProtocol>

@property (nonatomic, strong) SZUSA *usa;

@property (nonatomic, strong) SZIraq *iraq;

@end
