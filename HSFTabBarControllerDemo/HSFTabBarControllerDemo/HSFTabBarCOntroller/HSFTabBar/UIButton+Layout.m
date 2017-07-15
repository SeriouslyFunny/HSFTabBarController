//
//  UIButton+Layout.m
//  News
//
//  Created by monkey2016 on 16/11/29.
//  Copyright © 2016年 monkey2016. All rights reserved.
//

#import "UIButton+Layout.h"

@implementation UIButton (Layout)
- (void)layoutButtonWithEdgeInsetsStyle:(HSFButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)padding{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和padding得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case HSFButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-padding/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-padding/2.0, 0);
        }
            break;
        case HSFButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -padding/2.0, 0, padding/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, padding/2.0, 0, -padding/2.0);
        }
            break;
        case HSFButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-padding/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-padding/2.0, -imageWith, 0, 0);
        }
            break;
        case HSFButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+padding/2.0, 0, -labelWidth-padding/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-padding/2.0, 0, imageWith+padding/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
@end
