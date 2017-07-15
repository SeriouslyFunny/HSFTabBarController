//
//  VC1_2.m
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/14.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "VC1_2.h"

#import "VC1_3.h"

@interface VC1_2 ()

@end

@implementation VC1_2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextACTION:(UIButton *)sender {
    VC1_3 *vc = [[VC1_3 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
