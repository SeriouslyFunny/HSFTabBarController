//
//  VC4.m
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/14.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "VC4.h"

@interface VC4 ()

@property (nonatomic,strong) MBProgressHUD *hud;

@end

@implementation VC4

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //模拟网络请求数据加载
    self.hud = [MBProgressHUD showActivityMessageInView:@"正在努力加载中"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.hud removeFromSuperview];
    });
}
#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
   
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
