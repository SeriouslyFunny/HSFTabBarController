//
//  HSFTabBar.h
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/15.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, HSFTabBarStyle) {
    HSFTabBarStyle_none,
    HSFTabBarStyle_baseline,        //底线
    HSFTabBarStyle_dot,             //小点
    HSFTabBarStyle_block,           //方块
    HSFTabBarStyle_arrow            //尖角
};
typedef NS_ENUM(NSInteger, HSFIndicatorPosition) {
    HSFIndicatorPosition_bottom = 0,       //顶部
    HSFIndicatorPosition_top               //底部
};




@class HSFTabBar;

@protocol HSFTabBarDelegate <NSObject>

@optional

-(void)didSeletedHSFTabBar:(HSFTabBar *)tabBar atIndex:(NSInteger)index;

@end


@interface HSFTabBar : UIView

/* 必须设置的属性 */
@property (nonatomic,strong) NSArray *source;       //@[@{@"title":@"首页", @"selImg":@"", @"norImg":@""}]
@property (nonatomic,assign) id<HSFTabBarDelegate> delegate;


/* 可选属性 */
@property (nonatomic,strong) UIColor *norColor;     //未选中颜色(默认：lightGrayColor)
@property (nonatomic,strong) UIColor *selColor;     //选中颜色(默认：redColor)
@property (nonatomic,assign) CGFloat tabBarHeight;  //tabbar 的 高度(默认：50)
@property (nonatomic,assign) BOOL isHaveTopline;//是否有顶部的黑线(默认：NO)
@property (nonatomic,assign) BOOL isHaveBottomline;//是否有底部的黑线(默认：NO)
@property (nonatomic,assign) HSFTabBarStyle style;//样式(默认：无)
@property (nonatomic,assign) HSFIndicatorPosition indicatorPosition;//位置(默认：在下面)

//>>>>>>>>>>>>>>>>>>>>HSFTabBarStyle<<<<<<<<<<<<<<<<<<<<<<<<//
//①HSFTabBarStyle_baseline
@property (nonatomic,strong) UIColor *baseline_color;//默认：redColor
@property (nonatomic,assign) CGFloat baseline_height;//默认：3
@property (nonatomic,assign) CGFloat baseline_insert;//左右缩进(默认：10)

//②HSFTabBarStyle_dot
@property (nonatomic,strong) UIColor *dot_color;//默认：redColor
@property (nonatomic,assign) CGSize dot_size;//默认：CGSizeMake(10, 10)
@property (nonatomic,assign) CGFloat dot_insert;//上下缩进(默认：0)

//③HSFTabBarStyle_block
@property (nonatomic,strong) UIColor *block_color;//默认：[[UIColor greenColor] colorWithAlphaComponent:0.6]

//④HSFTabBarStyle_arrow
@property (nonatomic,strong) UIColor *arrow_color;//默认：redColor
@property (nonatomic,assign) CGSize arrow_size;//默认：CGSizeMake(10, 10)
@property (nonatomic,assign) CGFloat arrow_insert;//上下缩进(默认：0)




#pragma mark -必须在所有需要的属性配置完之后setUp 且必须setUp
-(void)setUp;



#pragma mark -//提供方法
//点击item
-(void)clickItemAtIndex:(NSInteger)index;

//设置边框圆角
-(void)setBaselineCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
-(void)setDotCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
-(void)setBlockCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

//设置间隔线（该方法要在setUp方法前设置 ，不然的话：paddingLine就是直接添加在上面 item的宽度还是原来的宽度）
-(void)setPaddingLineWithPadding_color:(UIColor *)padding_color padding_insert:(CGFloat)padding_insert;//默认：宽度=1


@end
