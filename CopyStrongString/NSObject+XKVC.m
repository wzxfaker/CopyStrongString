//
//  NSObject+XKVC.m
//  CopyStrongString
//
//  Created by X on 2018/3/10.
//  Copyright © 2018年 X. All rights reserved.
//

#import "NSObject+XKVC.h"
#import <objc/runtime.h>

@implementation NSObject (XKVC)

+ (void)setMyValue:(id)value forKey:(NSString *)key{
    if (key == nil || key.length == 0) {
        return;
    }
    if ([value isKindOfClass:[NSNull class]]) {
        [self setNilValueForKey:key];
        return;
    }
    if (![value isKindOfClass:[NSObject class]]) {
        @throw @"must be a NSObjet type";
        return;
    }
    NSString *funcName = [NSString stringWithFormat:@"set%@",key.capitalizedString];
    if ([self respondsToSelector:NSSelectorFromString(funcName)]) {//默认优先调用set方法
        [self performSelector:NSSelectorFromString(funcName) withObject:value];
    }
    unsigned int count;
    BOOL flag = false;
    Ivar *vars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = vars[i];
        NSString *keyName = [[NSString stringWithCString:ivar_getName(var) encoding:NSUTF8StringEncoding] substringFromIndex:1];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"_key"]]) {
            flag = true;
            object_setIvar(self, var, value);
            break;
        }
        if ([keyName isEqualToString:key]) {
            flag = true;
            object_setIvar(self, var, value);
            break;
        }
    }
    if (!flag) {
        [self setValue:value forUndefinedKey:key];
    }
}

@end
