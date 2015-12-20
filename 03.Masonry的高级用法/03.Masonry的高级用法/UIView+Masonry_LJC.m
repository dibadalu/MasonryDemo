//
//  UIView+Masonry_LJC.m
//  03.Masonry的高级用法
//
//  Created by 陈泽嘉 on 15/12/20.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
// 



#import "UIView+Masonry_LJC.h"
#import "Masonry.h"


@implementation UIView (Masonry_LJC)

- (void)distributeSpacingHorizontallyWith:(NSArray *)views{
    
    //创建spaces数组
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    
    //往spaces数组添加view
    for (int i = 0; i< views.count+1; i++) {
        
        UIView *v = [[UIView alloc] init];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);//宽宽与高度相等
        }];

    }
    
    //取出第0个space
    UIView *v0 = spaces[0];
    //添加约束
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(((UIView*)views[0]).mas_centerY);//y轴方向的中心点相等，同一水平线上
    }];
    
    //将第0个space存进preSpace，供下面的view对比使用
    UIView *preSpace = v0;
    for (int i = 0; i< views.count; i++) {
        
        //取出view和space
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(preSpace.mas_right);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(obj.mas_right);
            make.centerY.equalTo(obj.mas_centerY);//y轴方向的中心点相等，同一水平线上
            make.width.equalTo(v0);
        }];
        
        //将新的space存进preSpace
        preSpace = space;
        
    }
    
    //更新preSpace的约束
    [preSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
    }];
    
}

- (void)distributeSpacingVerticallyWith:(NSArray *)views{
    
    //创建spaces数组
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count + 1];
    
    //往spaces数组添加view
    for (int i = 0; i< views.count+1; i++) {
        UIView *v = [[UIView alloc] init];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);//宽度与高度相等
        }];
        
    }
    
    //取出第0个space
    UIView *v0 = spaces[0];
    //添加约束
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.centerX.equalTo(((UIView*)views[0]).mas_centerX);//x轴方向的中心点相等，同一垂直线上
    }];
    
    //将第0个space存进preSpace，供下面的view对比使用
    UIView *preSpace = v0;
    for (int i = 0; i< views.count; i++) {
        
        //取出view和space
        UIView *obj = views[i];
        UIView *space = spaces[i + 1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(preSpace.mas_bottom);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(obj.mas_bottom);
            make.centerX.equalTo(obj.mas_centerX);//x轴方向的中心点相等，同一垂直线上
            make.height.equalTo(v0);
        }];
        
        //将新的space存进preSpace
        preSpace = space;
        
    }
    
    //更新preSpace的约束
    [preSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
}

@end
