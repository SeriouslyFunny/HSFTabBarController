//
//  HSFTabBar.m
//  HSFTabBarControllerDemo
//
//  Created by JuZhenBaoiMac on 2017/7/15.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "HSFTabBar.h"

#import "UIButton+Layout.h"
#import <Masonry/Masonry.h>


@interface HSFTabBar ()

//require
@property (nonatomic,strong) UIButton *oldBtn;
@property (nonatomic,strong) NSDictionary *oldDic;
@property (nonatomic,strong) NSMutableArray *itemsArr;
@property (nonatomic,assign) CGFloat paddingWidth;//默认=0 当调用setPaddingLine.... 方法时=1

//option
@property (nonatomic,strong) UIView *topline;//顶部的黑线
@property (nonatomic,strong) UIView *bottomline;//顶部的黑线
@property (nonatomic,strong) UIView *baseline;
@property (nonatomic,strong) UIView *dot;
@property (nonatomic,strong) UIView *block;
@property (nonatomic,strong) UIView *arrow;



@end

@implementation HSFTabBar

//初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //默认设置
        self.norColor = [UIColor lightGrayColor];
        self.selColor = [UIColor redColor];
        self.tabBarHeight = 50;
        self.isHaveTopline = NO;
        self.isHaveBottomline = NO;
        self.style = HSFTabBarStyle_none;
        self.indicatorPosition = HSFIndicatorPosition_bottom;
        self.paddingWidth = 0;
        
        //可选属性（默认）
        self.baseline_color = [UIColor redColor];
        self.baseline_height = 3;
        self.baseline_insert = 10;
        
        self.dot_color = [UIColor redColor];
        self.dot_size = CGSizeMake(10, 10);
        self.dot_insert = 0;
        
        self.block_color = [[UIColor greenColor] colorWithAlphaComponent:0.6];
        
        self.arrow_color = [UIColor redColor];
        self.arrow_size = CGSizeMake(10, 10);
        self.arrow_insert = 0;
    }
    return self;
}
//设置间隔线（该方法要在setUp方法前设置 ，不然的话：paddingLine就是直接添加在上面 item的宽度还是原来的宽度）//默认：宽度=1
-(void)setPaddingLineWithPadding_color:(UIColor *)padding_color padding_insert:(CGFloat)padding_insert{
    self.paddingWidth = 1;
    //添加paddingLine
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - (self.source.count - 1)*self.paddingWidth)/self.source.count;//item的width
    CGFloat h = self.tabBarHeight - 2*padding_insert;
    for (int i = 0; i < self.source.count; i++) {
        CGFloat x = (w+self.paddingWidth)*i - 1;
        CGFloat y = padding_insert;
        UIView *paddingLine = [[UIView alloc]initWithFrame:CGRectMake(x, y, 1, h)];
        paddingLine.backgroundColor = padding_color;
        [self addSubview:paddingLine];
    }
}

#pragma mark -setUp
-(void)setUp{
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - (self.source.count - 1)*self.paddingWidth)/self.source.count;
    CGFloat h = self.tabBarHeight;
    for (int i = 0; i < self.source.count; i++) {
        CGFloat x = (w+self.paddingWidth)*i;
        CGFloat y = 0.0;
        
        //调整btn的位置
        if (self.style == HSFTabBarStyle_baseline) {
            h = self.tabBarHeight - self.baseline_height;
            if (self.indicatorPosition == HSFIndicatorPosition_bottom) {
                y = 0.0;
            }else if (self.indicatorPosition == HSFIndicatorPosition_top) {
                y = self.baseline_height;
            }
        }
        else if (self.style == HSFTabBarStyle_dot) {
            h = self.tabBarHeight - self.dot_size.height;
            if (self.indicatorPosition == HSFIndicatorPosition_bottom) {
                y = 0.0;
            }else if (self.indicatorPosition == HSFIndicatorPosition_top) {
                y = self.dot_size.height;
            }
        }
        else if (self.style == HSFTabBarStyle_block) {
            //do nothing
        }
        else if (self.style == HSFTabBarStyle_arrow) {
            h = self.tabBarHeight - self.arrow_size.height;
            if (self.indicatorPosition == HSFIndicatorPosition_bottom) {
                y = 0.0;
            }else if (self.indicatorPosition == HSFIndicatorPosition_top) {
                y = self.arrow_size.height;
            }
        }
        //初始化样式HSFTabBarStyle的位置
        if (i == 0) {
            if (self.style == HSFTabBarStyle_baseline) {
                if (self.indicatorPosition == HSFIndicatorPosition_bottom) {
                    self.baseline.frame = CGRectMake(self.baseline_insert, h, w - self.baseline_insert*2, self.baseline_height);
                }else if (self.indicatorPosition == HSFIndicatorPosition_top) {
                    self.baseline.frame = CGRectMake(self.baseline_insert, 0, w - self.baseline_insert*2, self.baseline_height);
                }
                self.baseline.backgroundColor = self.baseline_color;
                [self addSubview:self.baseline];
            }
            else if (self.style == HSFTabBarStyle_dot) {
                if (self.indicatorPosition == HSFIndicatorPosition_bottom) {
                    self.dot.frame = CGRectMake((w-self.dot_size.width)/2, h + self.dot_insert, self.dot_size.width, self.dot_size.height);
                }else if (self.indicatorPosition == HSFIndicatorPosition_top) {
                    self.dot.frame = CGRectMake((w-self.dot_size.width)/2, self.dot_insert, self.dot_size.width, self.dot_size.height);
                }
                self.dot.backgroundColor = self.dot_color;
                [self addSubview:self.dot];
                [self setDotCornerRadius:self.dot_size.height/2 borderColor:[UIColor blackColor] borderWidth:0];//默认圆角
            }
            else if (self.style == HSFTabBarStyle_block) {
                self.block.frame = CGRectMake(0, 0, w, h);
                self.block.backgroundColor = self.block_color;
                [self addSubview:self.block];
            }
            else if (self.style == HSFTabBarStyle_arrow) {
                if (self.indicatorPosition == HSFIndicatorPosition_bottom) {
                    self.arrow.frame = CGRectMake((w-self.arrow_size.width)/2, h + self.arrow_insert, self.arrow_size.width, self.arrow_size.height);
                }else if (self.indicatorPosition == HSFIndicatorPosition_top) {
                    self.arrow.frame = CGRectMake((w-self.arrow_size.width)/2, self.arrow_insert, self.arrow_size.width, self.arrow_size.height);
                }
                self.arrow.backgroundColor = self.arrow_color;
                [self addSubview:self.arrow];
                [self setArrowWithView:self.arrow];
            }
        }
        
        //添加item
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x, y, w, h);
        //配置
        NSDictionary *dic = self.source[i];
        [btn setTitle:dic[@"title"] forState:UIControlStateNormal];
        [btn setTitleColor:self.norColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:9];
        [btn setImage:[UIImage imageNamed:dic[@"norImg"]] forState:UIControlStateNormal];
        [btn layoutButtonWithEdgeInsetsStyle:HSFButtonEdgeInsetsStyleTop imageTitleSpace:0];
        [btn setTag:i];
        [btn addTarget:self action:@selector(itemACTION:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.itemsArr addObject:btn];
        
        if (i == 0) {
            self.oldBtn = btn;
            self.oldDic = dic;
            [self.oldBtn setTitleColor:self.selColor forState:UIControlStateNormal];
            [self.oldBtn setImage:[UIImage imageNamed:dic[@"selImg"]] forState:UIControlStateNormal];
            [self.oldBtn layoutButtonWithEdgeInsetsStyle:HSFButtonEdgeInsetsStyleTop imageTitleSpace:0];
        }
    }
    //添加顶部底部黑线
    __weak typeof(self) weakSelf = self;
    if (self.isHaveTopline) {
        [self addSubview:self.topline];
        [self.topline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(weakSelf);
            make.height.mas_equalTo(1);
        }];
    }
    if (self.isHaveBottomline) {
        [self addSubview:self.bottomline];
        [self.bottomline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(weakSelf);
            make.height.mas_equalTo(1);
        }];
    }
}



#pragma mark -点击事件
-(void)itemACTION:(UIButton *)sender{
    //状态处理
    NSDictionary *dic = self.source[sender.tag];
    [self.oldBtn setTitleColor:self.norColor forState:UIControlStateNormal];
    [self.oldBtn setImage:[UIImage imageNamed:self.oldDic[@"norImg"]] forState:UIControlStateNormal];
    [self.oldBtn layoutButtonWithEdgeInsetsStyle:HSFButtonEdgeInsetsStyleTop imageTitleSpace:0];
    [sender setTitleColor:self.selColor forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:dic[@"selImg"]] forState:UIControlStateNormal];
    [sender layoutButtonWithEdgeInsetsStyle:HSFButtonEdgeInsetsStyleTop imageTitleSpace:0];
    self.oldBtn = sender;
    self.oldDic = dic;
    
    //滑动
    [UIView animateWithDuration:0.1 animations:^{
        if (self.style == HSFTabBarStyle_baseline) {
            self.baseline.frame = CGRectMake(sender.frame.origin.x + self.baseline_insert, self.baseline.frame.origin.y, sender.frame.size.width - self.baseline_insert*2, self.baseline_height);
        }
        else if (self.style == HSFTabBarStyle_dot) {
            self.dot.frame = CGRectMake(sender.center.x - self.dot.frame.size.width/2, self.dot.frame.origin.y, self.dot_size.width, self.dot_size.height);
        }
        else if (self.style == HSFTabBarStyle_block) {
            self.block.frame = sender.frame;
        }
        else if (self.style == HSFTabBarStyle_arrow) {
            self.arrow.frame = CGRectMake(sender.center.x - self.arrow.frame.size.width/2, self.arrow.frame.origin.y, self.arrow_size.width, self.arrow_size.height);
        }
    }];
    
    //delegate
    if ([self.delegate respondsToSelector:@selector(didSeletedHSFTabBar:atIndex:)]) {
        [self.delegate didSeletedHSFTabBar:self atIndex:sender.tag];
    }
}



#pragma mark -//提供方法

//设置圆角边框
-(void)setBaselineCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    self.baseline.layer.masksToBounds = YES;
    self.baseline.layer.cornerRadius = cornerRadius;
    self.baseline.layer.borderColor = borderColor.CGColor;
    self.baseline.layer.borderWidth = borderWidth;
}
-(void)setDotCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    self.dot.layer.masksToBounds = YES;
    self.dot.layer.cornerRadius = cornerRadius;
    self.dot.layer.borderColor = borderColor.CGColor;
    self.dot.layer.borderWidth = borderWidth;
}
-(void)setBlockCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    self.block.layer.masksToBounds = YES;
    self.block.layer.cornerRadius = cornerRadius;
    self.block.layer.borderColor = borderColor.CGColor;
    self.block.layer.borderWidth = borderWidth;
}

//点击items
-(void)clickItemAtIndex:(NSInteger)index{
    UIButton *btn = self.itemsArr[index];
    [self itemACTION:btn];
}



#pragma mark -四边形变成三角形
-(void)setArrowWithView:(UIView *)view{
    //设置贝塞尔曲线，贝塞尔曲线的形状是一个三角形
    UIBezierPath *path = [UIBezierPath bezierPath];
    [view.backgroundColor setFill];
    [[UIColor clearColor]setStroke];
    [path setLineWidth:1];
    
    if (self.indicatorPosition == HSFIndicatorPosition_bottom) {
        [path moveToPoint:CGPointMake(view.frame.size.width/2, 0)];
        [path addLineToPoint:CGPointMake(view.frame.size.width, view.frame.size.height)];
        [path addLineToPoint:CGPointMake(0, view.frame.size.height)];
    }else if (self.indicatorPosition == HSFIndicatorPosition_top) {
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(view.frame.size.width, 0)];
        [path addLineToPoint:CGPointMake(view.frame.size.width/2, view.frame.size.height)];
    }
    
    [path closePath];
    //设置mask属性的层为CAShapeLayer，同时设置它的path属性为上面设置的贝塞尔曲线的路径，然后把上面的父视图的mask设置为CAShapeLayer
    CAShapeLayer *maksLayer = [CAShapeLayer layer];
    maksLayer.path = path.CGPath;
    view.layer.mask = maksLayer;
}






#pragma mark -懒加载
//require
-(NSMutableArray *)itemsArr{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
    }
    return _itemsArr;
}
//option
-(UIView *)topline{
    if (!_topline) {
        _topline = [[UIView alloc]init];
        _topline.backgroundColor = [UIColor blackColor];
    }
    return _topline;
}
-(UIView *)bottomline{
    if (!_bottomline) {
        _bottomline = [[UIView alloc]init];
        _bottomline.backgroundColor = [UIColor blackColor];
    }
    return _bottomline;
}

-(UIView *)baseline{
    if (!_baseline) {
        _baseline = [[UIView alloc]init];
    }
    return _baseline;
}
-(UIView *)dot{
    if (!_dot) {
        _dot = [[UIView alloc]init];
    }
    return _dot;
}
-(UIView *)block{
    if (!_block) {
        _block = [[UIView alloc]init];
    }
    return _block;
}
-(UIView *)arrow{
    if (!_arrow) {
        _arrow = [[UIView alloc]init];
    }
    return _arrow;
}





@end
