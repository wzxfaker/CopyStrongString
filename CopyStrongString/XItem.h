//
//  XItem.h
//  CopyStrongString
//
//  Created by X on 2018/3/10.
//  Copyright © 2018年 X. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XItem : NSObject

/** <##> */
@property (nonatomic,weak) NSString *title;
/** <##> */
@property (nonatomic,copy,readonly) NSString *desc;

@end
