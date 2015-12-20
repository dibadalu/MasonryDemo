//
//  ViewController.m
//  01.Masonry的基本使用
//
//  Created by 陈泽嘉 on 15/12/20.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *sv = [[UIView alloc] init];
    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    //添加约束
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);//居中
        make.size.mas_equalTo(CGSizeMake(300, 300));//size
        
    }];
    
    /*
    UIView *sv1 = [[UIView alloc] init];
    [sv1 showPlaceHolder];
    sv1.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv1];
    //添加约束
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
//        make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
//        make.top.equalTo(sv).offset(10);
//        make.left.equalTo(sv).offset(10);
//        make.bottom.equalTo(sv).offset(-10);
//        make.right.equalTo(sv).offset(-10);
        
    }];
     */
    
    UIView *sv3 = [[UIView alloc] init];
    [sv3 showPlaceHolder];
    sv3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:sv3];
    UIView *sv4 = [[UIView alloc] init];
    [sv4 showPlaceHolder];
    sv4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:sv4];
    
    
    //垂直居中且等宽且等间隔排列
    CGFloat padding = 10;//间隔
    CGFloat height = 150;//高度
    //添加约束
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).with.offset(padding);
        make.right.equalTo(sv4.mas_left).with.offset(-padding);
        make.height.equalTo(@(height));
        make.width.mas_equalTo(sv4);
        
    }];
    [sv4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv3.mas_right).with.offset(padding);
        make.right.equalTo(sv.mas_right).with.offset(-padding);
        make.height.equalTo(@(height));
        make.width.mas_equalTo(sv3);
        
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
