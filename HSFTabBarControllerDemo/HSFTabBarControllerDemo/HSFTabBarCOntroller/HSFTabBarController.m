//
//  HSFTabBarController.m
//  HCJ
//
//  Created by JuZhenBaoiMac on 2017/7/13.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "HSFTabBarController.h"

#import "HSFTabBar.h"
#import <Masonry/Masonry.h>

@interface HSFTabBarController ()<UIScrollViewDelegate, HSFTabBarDelegate>

//require
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *childVCArr_copy;
@property (nonatomic,strong) UIButton *oldBtn;
@property (nonatomic,strong) NSDictionary *oldDic;


@end

@implementation HSFTabBarController

//初始化方法
-(instancetype)init{
    if (self = [super init]) {
        //默认设置
        self.loadAll = NO;
        self.barPosition = HSFTabBarPosition_bottom;
        self.canScroll = NO;
        
        self.norColor = [UIColor lightGrayColor];
        self.selColor = [UIColor redColor];
        self.tabBarHeight = 50;
        self.isHaveTopline = NO;
        self.isHaveBottomline = NO;
        self.style = HSFTabBarStyle_none;
        self.indicatorPosition = HSFIndicatorPosition_bottom;
    }
    return self;
}

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//配置
-(void)setUp{
    
//bar>>>>>>>>>>>>>>>>>
    
    [self.tabBar setUp];
    [self.view addSubview:self.tabBar];
    __weak typeof(self) weakSelf = self;
    if (self.barPosition == HSFTabBarPosition_bottom) {
        [self.tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(weakSelf.view);
            make.height.mas_equalTo(self.tabBarHeight);
        }];
    }else if (self.barPosition == HSFTabBarPosition_top) {
        [self.tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(weakSelf.view);
            make.height.mas_equalTo(self.tabBarHeight);
        }];
    }
    
//content>>>>>>>>>>>>>>>>>>>>>>
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.childVCArr.count, self.scrollView.frame.size.height);
    [self.view addSubview:self.scrollView];
    if (self.barPosition == HSFTabBarPosition_bottom) {
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(weakSelf.view);
            make.bottom.equalTo(weakSelf.tabBar.mas_top);
        }];
    }else if (self.barPosition == HSFTabBarPosition_top) {
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(weakSelf.view);
            make.top.equalTo(weakSelf.tabBar.mas_bottom);
        }];
    }
    
    //是否一次全部加载
    if (self.loadAll) {
        __block CGFloat x = 0.0;
        [self.childVCArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIViewController *vc = (UIViewController *)obj;
            [vc viewDidLoad];
            [self addChildViewController:vc];
            [self.childVCArr_copy addObject:vc];
            x = self.scrollView.frame.size.width * idx;
            vc.view.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
            [self.scrollView addSubview:vc.view];
            //子控制器标题
            [self setNaviTitleWithController:vc atIndex:idx];
        }];

    }else{
        //添加第一个vc
        UIViewController *vc = self.childVCArr.firstObject;
        [vc viewDidLoad];
        [self addChildViewController:vc];
        [self.childVCArr_copy addObject:vc];
        vc.view.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:vc.view];
        //子控制器标题
        [self setNaviTitleWithController:vc atIndex:0];
    }
    //是否可以左右滑动
    if (self.canScroll) {
        self.scrollView.scrollEnabled = YES;
    }else{
        self.scrollView.scrollEnabled = NO;
    }
}

#pragma mark -设置子控制器的标题
-(void)setNaviTitleWithController:(id)vc atIndex:(NSInteger)index{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navi = (UINavigationController *)vc;
        UIViewController *baseVC = navi.childViewControllers[0];
        baseVC.navigationItem.title = self.source[index][@"title"];
    }else if ([vc isKindOfClass:[UIViewController class]]) {
        UIViewController *NewVC = (UIViewController *)vc;
        NewVC.navigationItem.title = self.source[index][@"title"];
    }
}


#pragma mark -HSFTabBarDelegate
-(void)didSeletedHSFTabBar:(HSFTabBar *)tabBar atIndex:(NSInteger)index{
    //是否一次全部加载
    if (self.loadAll) {
        //do nothing
    }else{
        UIViewController *vc = self.childVCArr[index];
        if (![self.childVCArr_copy containsObject:vc]) {
            [vc viewDidLoad];
            [self addChildViewController:vc];
            [self.childVCArr_copy addObject:vc];
            CGFloat x = self.scrollView.frame.size.width * index;
            vc.view.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
            [self.scrollView addSubview:vc.view];
            //子控制器标题
            [self setNaviTitleWithController:vc atIndex:index];
        }
    }
    //滑动
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * index, 0) animated:self.canScroll];
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.scrollView) {
        //计算出index 模拟点击item
        int index = (int)(scrollView.contentOffset.x + scrollView.frame.size.width/2)/scrollView.frame.size.width;
        NSLog(@"========%d",index);
        [self.tabBar clickItemAtIndex:index];
    }
}



#pragma mark -懒加载
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.tabBarHeight)];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}
-(HSFTabBar *)tabBar{
    if (!_tabBar) {
        _tabBar = [[HSFTabBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tabBarHeight)];
        _tabBar.backgroundColor = [UIColor whiteColor];
        _tabBar.source = self.source;
        _tabBar.norColor = self.norColor;
        _tabBar.selColor = self.selColor;
        _tabBar.delegate = self;
        _tabBar.tabBarHeight = self.tabBarHeight;
        //可选的属性
        _tabBar.isHaveTopline = self.isHaveTopline;
        _tabBar.isHaveBottomline = self.isHaveBottomline;
        _tabBar.style = self.style;
        _tabBar.indicatorPosition = self.indicatorPosition;
        if (self.style == HSFTabBarStyle_baseline) {
            _tabBar.baseline_color = self.baseline_color;
            _tabBar.baseline_height = self.baseline_height;
            _tabBar.baseline_insert = self.baseline_insert;
        }
        else if (self.style == HSFTabBarStyle_dot) {
            _tabBar.dot_color = self.dot_color;
            _tabBar.dot_size = self.dot_size;
            _tabBar.dot_insert = self.dot_insert;
        }
        else if (self.style == HSFTabBarStyle_block) {
            _tabBar.block_color = self.block_color;
        }
        else if (self.style == HSFTabBarStyle_arrow) {
            _tabBar.arrow_color = self.arrow_color;
            _tabBar.arrow_size = self.arrow_size;
            _tabBar.arrow_insert = self.arrow_insert;
        }
    }
    return _tabBar;
}
-(NSMutableArray *)childVCArr_copy{
    if (!_childVCArr_copy) {
        _childVCArr_copy = [NSMutableArray array];
    }
    return _childVCArr_copy;
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
