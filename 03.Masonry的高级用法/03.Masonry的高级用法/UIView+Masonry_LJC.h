//
//  UIView+Masonry_LJC.h
//  03.Masonry的高级用法
//
//  Created by 陈泽嘉 on 15/12/20.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masonry_LJC)

/**
 *  横向等间隙排列一组view
 *
 *  @param views views数组
 */
- (void)distributeSpacingHorizontallyWith:(NSArray *)views;

/**
 *  纵向等间隙排列一组view
 *
 *  @param views views数组
 */
- (void)distributeSpacingVerticallyWith:(NSArray *)views;

@end
