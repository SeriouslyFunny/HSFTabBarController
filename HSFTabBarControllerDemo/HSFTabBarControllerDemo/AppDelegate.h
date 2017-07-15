//
//  AppDelegate.h
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/14.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSFTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) HSFTabBarController *tabBarC;

-(void)show6Items;

@end

