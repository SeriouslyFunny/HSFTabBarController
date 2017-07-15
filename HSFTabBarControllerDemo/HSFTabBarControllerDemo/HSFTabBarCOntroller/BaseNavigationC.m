//
//  BaseNavigationC.m
//  CDBLG
//
//  Created by JuZhenBaoiMac on 2017/4/22.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "BaseNavigationC.h"

#import "AppDelegate.h"
#import "HSFTabBarController.h"
#import <Masonry/Masonry.h>

@interface BaseNavigationC ()

@end

@implementation BaseNavigationC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor whiteColor];// 设置导航栏背景颜色
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor blackColor]}];// 设置导航栏文字字体大小 文字的颜色
    
}

//push时隐藏tabbar
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backACTION)];
    }
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.tabBarC.tabBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0);
    }];
    [super pushViewController:viewController animated:animated];
}
//pop
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated{
    UIViewController *vc = [super popViewControllerAnimated:animated];
    
    if (self.childViewControllers.count == 1) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.tabBarC.tabBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(delegate.tabBarC.tabBarHeight);
        }];
    }
    
    return vc;
}

-(void)backACTION{
    [self popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
