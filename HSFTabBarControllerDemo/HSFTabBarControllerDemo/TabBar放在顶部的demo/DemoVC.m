//
//  DemoVC.m
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/17.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "DemoVC.h"


//子控制器
#import "ChildVC1.h"
#import "ChildVC2.h"
#import "ChildVC3.h"


@interface DemoVC ()

@end

@implementation DemoVC




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"DEMO";
    
    //请添加一下两行代码 调整约束
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    ChildVC1 *vc1 = [[ChildVC1 alloc]init];
    ChildVC2 *vc2 = [[ChildVC2 alloc]init];
    ChildVC3 *vc3 = [[ChildVC3 alloc]init];


    self.childVCArr = @[vc1, vc2, vc3];
    self.source = @[@{@"title":@"商品", @"selImg":@"home_sel", @"norImg":@"home_nor"},
                       @{@"title":@"评论", @"selImg":@"home_sel", @"norImg":@"home_nor"},
                       @{@"title":@"商家信息", @"selImg":@"home_sel", @"norImg":@"home_nor"}];
    
    
    self.norColor = [UIColor lightGrayColor];
    self.selColor = [UIColor redColor];
    self.isHaveTopline = YES;//是否有顶部的黑线
    self.isHaveBottomline = YES;//是否有底部的黑线
    self.loadAll = YES;//是否一次全部加载
    self.canScroll = YES;
    self.tabBarHeight = 50;
    
    //设置样式
    self.barPosition = HSFTabBarPosition_top;
    
    self.style = HSFTabBarStyle_arrow;
    self.arrow_color = [UIColor redColor];
    self.arrow_size = CGSizeMake(10, 5);
    self.arrow_insert = 0;
    
    //添加paddingLine
    [self.tabBar setPaddingLineWithPadding_color:[UIColor groupTableViewBackgroundColor] padding_insert:10];
    
    [self setUp];//最后必须setUp
        
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
