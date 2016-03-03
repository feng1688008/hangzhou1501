//
//  ViewController.m
//  运行时关联
//
//  Created by 李洪峰 on 16/2/24.
//  Copyright © 2016年 LHF. All rights reserved.
//

#import "ViewController.h"

#import  <objc/runtime.h>//运行时头文件

static char overviewKey;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //将一个字符串关联到数组上
    NSArray *array = [[NSArray alloc]initWithObjects:@"One",@"Two",@"Three", nil];
    
    //111为了演示的目的，这里使用initWithFormat:来确保字符串可以被销毁
    NSString * overview = [[NSString alloc] initWithFormat:@"%@",@"First three numbers"];
    
    //源对象,关键字,被关联的对象,关联策略
    objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
    
    NSString *associatedObject = (NSString *)objc_getAssociatedObject(array, &overviewKey);
    NSLog(@"associatedObject:%@", associatedObject);

    //设置为nil 就是解除关联
    objc_setAssociatedObject(array, &overviewKey, nil, OBJC_ASSOCIATION_ASSIGN);
}


@end
