//
//  ViewController.m
//  CopyStrongString
//
//  Created by X on 2017/11/19.
//  Copyright © 2017年 X. All rights reserved.
//

#import "ViewController.h"
#import "XItem.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *strongName;
/** <##> */
@property (nonatomic,copy) NSString *copyedName;
/** <##> */
@property (nonatomic,weak) NSString *weakName;
/** <##> */
@property (nonatomic,strong) NSMutableArray *copyedArr;
/** <##> */
@property (nonatomic,strong) NSMutableString *copyedStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableString *mStr = [NSMutableString stringWithString:@"王泽"];
//    self.strongName = mStr;
//    self.copyedName = mStr;
    self.weakName = mStr;
//    NSLog(@"namePre--%@,%@",self.strongName,self.copyedName);
    [mStr appendString:@"信"];
//    NSLog(@"nameAfter--%@,%@",self.strongName,self.copyedName);
    NSLog(@"weakName--%@",self.weakName);
    
    __block NSMutableString *a = [NSMutableString stringWithString:@"wangzexin"];
//    NSLog(@"before--a指向的堆中的内存地址：%p,a在栈中的内存地址：%p,%@",a,&a,a);
    void (^foo)(void) = ^{
        a.string = @"youyuan";
//        NSLog(@"内部--a指向的堆中的内存地址：%p,a在栈中的内存地址：%p，%@",a,&a,a);
        a = [NSMutableString stringWithString:@"hahaha"];
    };
    foo();
//    NSLog(@"after--a指向的堆中的内存地址：%p,a在栈中的内存地址：%p,%@",a,&a,a);
    
    NSMutableArray *b = [NSMutableArray arrayWithObjects:@"kobe",@"james", nil];
    NSLog(@"%@",b);
    void (^foo1)(void) = ^{
        [b addObject:@"curry"];
//        NSLog(@"%@",b);
//        b = [NSMutableArray arrayWithObjects:@"durant", nil];
    };
    foo1();
//    NSLog(@"%@",b);
    
    XItem *itemModel = [[XItem alloc] init];
    itemModel.title = mStr;
    [mStr appendString:@"信"];
//    itemModel.desc = @"我是一个好人啊";
    [itemModel setValue:@"male" forKey:@"title"];
    NSLog(@"%@",[itemModel valueForKey:@"title"]);
//    [itemModel setValue:@"我是一个好人" forKey:@"desc"];
    NSLog(@"%@",itemModel.desc);
//    NSLog(@"🏀🏀--%@",itemModel.title);
    
//    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"abc",@"def",@"ghi", nil];
//    self.copyedArr = array;
    self.copyedArr = [NSMutableArray arrayWithObjects:@"abc",@"def",@"ghi", nil];
    [self.copyedArr addObject:@"mno"];
    NSLog(@"🏀--%@",self.copyedArr);
    
    NSMutableString *copyedStr = [NSMutableString stringWithString:@"解忧杂货店"];
    self.copyedStr = copyedStr;
    [self.copyedStr appendString:@"怎么样啊"];
    NSLog(@"⚽️--%@",self.copyedStr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
