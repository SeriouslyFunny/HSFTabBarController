//
//  VC1.m
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/14.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "VC1.h"

#import "VC1_2.h"

@interface VC1 ()

@property (nonatomic,strong) MBProgressHUD *hud;

@end

@implementation VC1


#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
//    //模拟网络请求数据加载
//    self.hud = [MBProgressHUD showActivityMessageInView:@"正在努力加载中"];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.hud removeFromSuperview];
//    });
}
- (IBAction)nextACTION:(UIButton *)sender {
    VC1_2 *vc1_2 = [[VC1_2 alloc]init];
    [self.navigationController pushViewController:vc1_2 animated:YES];
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
