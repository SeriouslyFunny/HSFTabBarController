//
//  MBProgressHUD+JDragon.m
//  JDragonHUD
//
//  Created by JDragon on 2017/1/17.
//  Copyright © 2017年 JDragon. All rights reserved.
//

#import "MBProgressHUD+JDragon.h"

@implementation MBProgressHUD (JDragon)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
//    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.label.text=message?message:@"加载中.....";
    hud.label.numberOfLines = 0;
    hud.label.font=[UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = YES;
    
    return hud;
}
#pragma mark-------------------- show Tip----------------------------

+ (MBProgressHUD *)showTipMessageInWindow:(NSString*)message
{
    MBProgressHUD *hud = [self showTipMessage:message isWindow:true timer:1];
    return hud;
}
+ (MBProgressHUD *)showTipMessageInView:(NSString*)message
{
    MBProgressHUD *hud = [self showTipMessage:message isWindow:false timer:1];
    return hud;
}
+ (MBProgressHUD *)showTipMessageInWindow:(NSString*)message timer:(int)aTimer
{
    MBProgressHUD *hud = [self showTipMessage:message isWindow:true timer:aTimer];
    return hud;
}
+ (MBProgressHUD *)showTipMessageInView:(NSString*)message timer:(int)aTimer
{
    MBProgressHUD *hud = [self showTipMessage:message isWindow:false timer:aTimer];
    return hud;
}
+ (MBProgressHUD *)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:1];
    return hud;
}
#pragma mark-------------------- show Activity----------------------------

+ (MBProgressHUD *)showActivityMessageInWindow:(NSString*)message
{
    MBProgressHUD *hud  =  [self showActivityMessage:message isWindow:true timer:0];
    return hud;
}
+ (MBProgressHUD *)showActivityMessageInView:(NSString*)message
{
    MBProgressHUD *hud  =  [self showActivityMessage:message isWindow:false timer:0];
    return hud;
}
+ (MBProgressHUD *)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self showActivityMessage:message isWindow:true timer:aTimer];
    return hud;
}
+ (MBProgressHUD *)showActivityMessageInView:(NSString*)message timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self showActivityMessage:message isWindow:false timer:aTimer];
    return hud;
}
+ (MBProgressHUD *)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hide:YES afterDelay:aTimer];
    }
    return hud;
}
#pragma mark-------------------- show Image----------------------------

+ (MBProgressHUD *)showSuccessMessage:(NSString *)Message
{
    MBProgressHUD *hud  =  [self showCustomIconInWindow:@"MBHUD_Success" message:Message];
    return hud;
}
+ (MBProgressHUD *)showErrorMessage:(NSString *)Message
{
    MBProgressHUD *hud  =  [self showCustomIconInWindow:@"MBHUD_Error" message:Message];
    return hud;
}
+ (MBProgressHUD *)showInfoMessage:(NSString *)Message
{
    MBProgressHUD *hud  =  [self showCustomIconInWindow:@"MBHUD_Info" message:Message];
    return hud;
}
+ (MBProgressHUD *)showWarnMessage:(NSString *)Message
{
    MBProgressHUD *hud  =  [self showCustomIconInWindow:@"MBHUD_Success" message:Message];
    return hud;
}
+ (MBProgressHUD *)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    MBProgressHUD *hud  =  [self showCustomIcon:iconName message:message isWindow:true];
    return hud;
    
}
+ (MBProgressHUD *)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    MBProgressHUD *hud  =  [self showCustomIcon:iconName message:message isWindow:false];
    return hud;
}
+ (MBProgressHUD *)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[@"MBProgressHUD+JDragon.bundle/MBProgressHUD" stringByAppendingPathComponent:iconName]]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:1];
    return hud;
}
+ (void)hideHUD
{
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:winView animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];
}
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}

@end
