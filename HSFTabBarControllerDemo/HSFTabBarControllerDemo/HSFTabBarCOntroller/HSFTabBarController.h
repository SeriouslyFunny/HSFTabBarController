//
//  HSFTabBarController.h
//  HCJ
//
//  Created by JuZhenBaoiMac on 2017/7/13.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, HSFTabBarPosition) {
    HSFTabBarPosition_bottom = 0,       //顶部
    HSFTabBarPosition_top               //底部
};


@class HSFTabBar;

@interface HSFTabBarController : UIViewController
@property (nonatomic,strong) HSFTabBar *tabBar;


/* tabBarController必须设置的属性 */
@property (nonatomic,strong) NSArray *childVCArr;   //子控制器数组（childVCArr.count 必须 == source.count）
/* tabBar必须设置的属性 */
@property (nonatomic,strong) NSArray *source;       //@[@{@"title":@"首页", @"selImg":@"", @"norImg":@""}]



/* tabBarController可选属性 */
@property (nonatomic,assign) BOOL loadAll;                  //一次全部加载(默认是NO)
@property (nonatomic,assign) HSFTabBarPosition barPosition; //位置(默认在下面)
@property (nonatomic,assign) BOOL canScroll;                //是否可以左右滑动(默认NO)

/* tabbar可选属性 */
@property (nonatomic,strong) UIColor *norColor;                         //未选中颜色(默认：lightGrayColor)
@property (nonatomic,strong) UIColor *selColor;                         //选中颜色(默认：redColor)
@property (nonatomic,assign) CGFloat tabBarHeight;                      //tabbar 的 高度(默认：50)
@property (nonatomic,assign) BOOL isHaveTopline;                        //是否有顶部的黑线(默认是NO)
@property (nonatomic,assign) BOOL isHaveBottomline;                     //是否有底部的黑线(默认是NO)
@property (nonatomic,assign) HSFTabBarStyle style;                      //样式（默认：无）
@property (nonatomic,assign) HSFIndicatorPosition indicatorPosition;    //位置(默认在下面)

//>>>>>>>>>>>>>>>>>>>>HSFTabBarStyle<<<<<<<<<<<<<<<<<<<<<<<<//
//这些属性如不设置的话就是HSFTabBar默认设置的属性
//①HSFTabBarStyle_baseline
@property (nonatomic,strong) UIColor *baseline_color;
@property (nonatomic,assign) CGFloat baseline_height;
@property (nonatomic,assign) CGFloat baseline_insert;//左右缩进

//②HSFTabBarStyle_dot
@property (nonatomic,strong) UIColor *dot_color;
@property (nonatomic,assign) CGSize dot_size;
@property (nonatomic,assign) CGFloat dot_insert;//上下缩进

//③HSFTabBarStyle_block
@property (nonatomic,strong) UIColor *block_color;

//④HSFTabBarStyle_arrow
@property (nonatomic,strong) UIColor *arrow_color;
@property (nonatomic,assign) CGSize arrow_size;
@property (nonatomic,assign) CGFloat arrow_insert;//上下缩进



#pragma mark -tabbarController 必须在所有需要的属性配置完之后setUp 且必须setUp
-(void)setUp;



@end
