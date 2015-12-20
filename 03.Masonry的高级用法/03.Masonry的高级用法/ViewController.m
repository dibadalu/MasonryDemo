//
//  ViewController.m
//  03.Masonry的高级用法
//
//  Created by 陈泽嘉 on 15/12/20.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//  高级： 横向或者纵向等间隙的排列一组view
//   技巧就是 使用空白的占位view来填充我们目标view的旁边 这点通过图上的空白标注可以看出来

#import "ViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
#import "UIView+Masonry_LJC.h"

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
    
    
    
    UIView *sv11 = [[UIView alloc] init];
    UIView *sv12 = [[UIView alloc] init];
    UIView *sv13 = [[UIView alloc] init];
    UIView *sv21 = [[UIView alloc] init];
    UIView *sv31 = [[UIView alloc] init];
    
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);//同一水平线上
        make.centerX.equalTo(@[sv21,sv31]);//同一垂直线上
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];

    
    [sv distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    
    [sv showPlaceHolderWithAllSubviews];
    [sv hidePlaceHolder];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
