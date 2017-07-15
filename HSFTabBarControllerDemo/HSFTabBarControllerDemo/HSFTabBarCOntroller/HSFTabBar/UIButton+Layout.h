//
//  UIButton+Layout.h
//  News
//
//  Created by monkey2016 on 16/11/29.
//  Copyright © 2016年 monkey2016. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HSFButtonEdgeInsetsStyle) {
    HSFButtonEdgeInsetsStyleTop, // image在上，label在下
    HSFButtonEdgeInsetsStyleLeft, // image在左，label在右
    HSFButtonEdgeInsetsStyleBottom, // image在下，label在上
    HSFButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (Layout)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param padding titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(HSFButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)padding;
@end
