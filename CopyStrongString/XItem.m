//
//  XItem.m
//  CopyStrongString
//
//  Created by X on 2018/3/10.
//  Copyright © 2018年 X. All rights reserved.
//

#import "XItem.h"

@implementation XItem
{
    NSString *sex;
}

- (id)init{
    if (self = [super init]) {
        sex = @"我是男的";
    }
    return self;
}

+ (BOOL)accessInstanceVariablesDirectly{
    return NO;
    
}

@end
