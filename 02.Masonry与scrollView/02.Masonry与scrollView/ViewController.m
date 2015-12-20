//
//  ViewController.m
//  02.Masonry与scrollView
//
//  Created by 陈泽嘉 on 15/12/20.
//  Copyright (c) 2015年 dibadalu. All rights reserved.
//  中级：在UIScrollView顺序排列一些view并自动计算contentSize

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
    
    
    //创建scrollView
    UIScrollView *scrollv = [[UIScrollView alloc] init];
    [scrollv showPlaceHolder];
    scrollv.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollv];
    //添加scrollv的约束
    [scrollv mas_makeConstraints:^(MASConstraintMaker *make) {
        //scrolv与父控件的边界间距都为5
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    //此时scrollView还不能滚动，缺少contenSize
    

    //创建container，作为中间层，能够自动计算scrollView的contenSize
    UIView *container = [[UIView alloc] init];
    [container showPlaceHolder];
    [scrollv addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollv);
        make.width.equalTo(scrollv);
    }];
    
    int count = 10;
    
    UIView *preView = nil;
    
    for (int i = 0; i <= count; i++) {
        
        //创建子view
        UIView *subv = [[UIView alloc] init];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        //添加约束
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.and.right.equalTo(container);//左右边界
            make.height.mas_equalTo(@(20 * i));//高度
            
            if (preView) {//存在上一个子view
                make.top.equalTo(preView.mas_bottom);
            }else{
                make.top.equalTo(container.mas_top);
            }
            
        }];
        
        preView = subv;
        
    }
    
    
#warning 关键就在于container这个view起到了一个中间层的作用 能够自动的计算uiscrollView的contentSize
    //补充container的约束
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(preView.mas_bottom);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
