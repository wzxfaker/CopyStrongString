//
//  NSObject+XKVC.h
//  CopyStrongString
//
//  Created by X on 2018/3/10.
//  Copyright © 2018年 X. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XKVC)

+ (void)setMyValue:(id)value forKey:(NSString *)key;

@end
