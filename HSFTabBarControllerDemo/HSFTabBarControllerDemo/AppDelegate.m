//
//  AppDelegate.m
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/14.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "AppDelegate.h"

#import "HSFTabBarController.h"
#import "BaseNavigationC.h"

#import "VC1.h"
#import "VC2.h"
#import "VC3.h"
#import "VC4.h"
#import "VC5.h"
#import "VC6.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

/* 请看这里 */
-(void)show6Items{
    VC1 *vc1 = [[VC1 alloc]init];
    VC2 *vc2 = [[VC2 alloc]init];
    VC3 *vc3 = [[VC3 alloc]init];
    VC4 *vc4 = [[VC4 alloc]init];
    VC5 *vc5 = [[VC5 alloc]init];
    VC6 *vc6 = [[VC6 alloc]init];
    
    BaseNavigationC *navi1 = [[BaseNavigationC alloc]initWithRootViewController:vc1];
    BaseNavigationC *navi2 = [[BaseNavigationC alloc]initWithRootViewController:vc2];
    BaseNavigationC *navi3 = [[BaseNavigationC alloc]initWithRootViewController:vc3];
    BaseNavigationC *navi4 = [[BaseNavigationC alloc]initWithRootViewController:vc4];
    BaseNavigationC *navi5 = [[BaseNavigationC alloc]initWithRootViewController:vc5];
    BaseNavigationC *navi6 = [[BaseNavigationC alloc]initWithRootViewController:vc6];
    
    self.tabBarC = [[HSFTabBarController alloc]init];
    self.tabBarC.childVCArr = @[navi1, navi2, navi3, navi4, navi5, navi6];
    self.tabBarC.source = @[@{@"title":@"首页", @"selImg":@"home_sel", @"norImg":@"home_nor"},
                              @{@"title":@"资讯", @"selImg":@"home_sel", @"norImg":@"home_nor"},
                              @{@"title":@"论坛", @"selImg":@"home_sel", @"norImg":@"home_nor"},
                              @{@"title":@"店铺管理", @"selImg":@"home_sel", @"norImg":@"home_nor"},
                              @{@"title":@"购物车", @"selImg":@"home_sel", @"norImg":@"home_nor"},
                              @{@"title":@"个人中心", @"selImg":@"home_sel", @"norImg":@"home_nor"}];
    
    
//    self.tabBarC.norColor = [UIColor lightGrayColor];
//    self.tabBarC.selColor = [UIColor redColor];
//    self.tabBarC.isHaveTopline = YES;//是否有顶部的黑线
//    self.tabBarC.isHaveBottomline = YES;//是否有底部的黑线
    self.tabBarC.loadAll = NO;//是否一次全部加载
//    self.tabBarC.canScroll = YES;
//    self.tabBarC.tabBarHeight = 50;
    
    //设置样式
//    self.tabBarC.barPosition = HSFTabBarPosition_top;
//    self.tabBarC.barPosition = HSFTabBarPosition_bottom;
    
//    self.tabBarC.indicatorPosition = HSFIndicatorPosition_top;
//    self.tabBarC.indicatorPosition = HSFIndicatorPosition_bottom;
    
//    self.tabBarC.style = HSFTabBarStyle_baseline;
//    self.tabBarC.baseline_color = [UIColor redColor];
//    self.tabBarC.baseline_height = 3;
//    self.tabBarC.baseline_insert = 10;

//    self.tabBarC.style = HSFTabBarStyle_dot;
//    self.tabBarC.dot_color = [UIColor redColor];
//    self.tabBarC.dot_size = CGSizeMake(10, 10);
//    self.tabBarC.dot_insert = 5;
    
//    self.tabBarC.style = HSFTabBarStyle_block;
//    self.tabBarC.block_color = [[UIColor greenColor] colorWithAlphaComponent:0.6];

//    self.tabBarC.style = HSFTabBarStyle_arrow;
//    self.tabBarC.arrow_color = [UIColor redColor];
//    self.tabBarC.arrow_size = CGSizeMake(10, 5);
//    self.tabBarC.arrow_insert = 0;
    
    //添加paddingLine
//    [self.tabBarC.tabBar setPaddingLineWithPadding_color:[UIColor groupTableViewBackgroundColor] padding_insert:10];
    
    [self.tabBarC setUp];//最后必须setUp
    self.window.rootViewController = self.tabBarC;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /* 请看这里 */
    [self show6Items];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
