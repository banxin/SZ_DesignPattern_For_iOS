//
//  SZTerminalExpression.m
//  SZ_DesignPattern_For_iOS
//
//  Created by yanl on 2018/1/5.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import "SZTerminalExpression.h"
#import "SZContext.h"

@implementation SZTerminalExpression

- (NSString *)interpret:(SZContext *)context
{
    return [NSString stringWithFormat:@"终端解释器, %@, %@", context.input, context.output];
}

@end
