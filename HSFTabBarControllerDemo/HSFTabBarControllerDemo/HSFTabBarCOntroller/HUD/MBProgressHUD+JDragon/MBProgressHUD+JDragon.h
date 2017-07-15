//
//  MBProgressHUD+JDragon.h
//  JDragonHUD
//
//  Created by JDragon on 2017/1/17.
//  Copyright © 2017年 JDragon. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (JDragon)

+ (MBProgressHUD *)showTipMessageInWindow:(NSString*)message;
+ (MBProgressHUD *)showTipMessageInView:(NSString*)message;
+ (MBProgressHUD *)showTipMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (MBProgressHUD *)showTipMessageInView:(NSString*)message timer:(int)aTimer;


+ (MBProgressHUD *)showActivityMessageInWindow:(NSString*)message;
+ (MBProgressHUD *)showActivityMessageInView:(NSString*)message;
+ (MBProgressHUD *)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (MBProgressHUD *)showActivityMessageInView:(NSString*)message timer:(int)aTimer;


+ (MBProgressHUD *)showSuccessMessage:(NSString *)Message;
+ (MBProgressHUD *)showErrorMessage:(NSString *)Message;
+ (MBProgressHUD *)showInfoMessage:(NSString *)Message;
+ (MBProgressHUD *)showWarnMessage:(NSString *)Message;


+ (MBProgressHUD *)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (MBProgressHUD *)showCustomIconInView:(NSString *)iconName message:(NSString *)message;


+ (void)hideHUD;

@end
