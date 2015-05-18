//
//  ChoosePayViewController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/15.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ChoosePayViewController.h"
#import "BuyMainViewController.h"
#import "MyConfig.h"

@interface ChoosePayViewController ()

@end

@implementation ChoosePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
#pragma mark 设置导航条
    UIView *nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 64)];
    nav.backgroundColor = [UIColor blackColor];
    
    //设置导航条文字
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, SIZEWIDTH-200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font            = [UIFont  systemFontOfSize:25];  //设置文本字体与大小
    titleLabel.textColor       = [UIColor whiteColor];  //设置文本颜色
    titleLabel.textAlignment   = NSTextAlignmentCenter;
    titleLabel.text = @"选择支付";
    
    [nav addSubview:titleLabel];
    
    //设置导航栏左侧“返回”按钮
    UIButton *fanhui = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 64)];
    [fanhui addTarget:self action:@selector(didClickReturnButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"returnback" ofType:@"png"]];
    image = [self reSizeImage:image toSize:CGSizeMake(13.0f, 25.0f)];
    
    [fanhui setImage:image forState:UIControlStateNormal];
    [fanhui setTitle:@" 返回" forState:UIControlStateNormal];
    fanhui.titleLabel.font = [UIFont systemFontOfSize:20];
    
    fanhui.imageEdgeInsets = UIEdgeInsetsMake(26.5,-15,5,fanhui.titleLabel.bounds.size.width);
    fanhui.titleEdgeInsets = UIEdgeInsetsMake(26.5, -5, 5, 13);
    
    [nav addSubview:fanhui];
    [self.view addSubview:nav];
    
#pragma mark 第一个tableview
    int Edge = SIZEWIDTH/15;
    UIView *commodityImformation = [[UIView alloc] initWithFrame:CGRectMake(Edge, nav.frame.size.height + 2*Edge, SIZEWIDTH - 2*Edge, SIZEHEIGHT/4)];
    commodityImformation.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < 3; i++) {
        UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, i * commodityImformation.frame.size.height/3, commodityImformation.frame.size.width, commodityImformation.frame.size.height)];
    }
    commodityImformation.layer.borderWidth = 1;
    commodityImformation.layer.borderColor = [[UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0] CGColor];
    
    //commodityImformation.style = UITableViewCellStyleValue2;
    [self.view addSubview:commodityImformation];
#pragma mark 添加确认支付按钮
    UIButton *buyNowButton = [[UIButton alloc] initWithFrame:CGRectMake(Edge, SIZEHEIGHT-Edge*4.5, SIZEWIDTH - 2*Edge, 50)];
    [buyNowButton setBackgroundColor:[UIColor colorWithRed:241.0/255.0 green:171.0/255.0 blue:71.0/255.0 alpha:1.0]];
    [buyNowButton setTitle:@"确认支付" forState:UIControlStateNormal];
    [buyNowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:buyNowButton];
    [buyNowButton addTarget:self action:@selector(didClickBuyButtonAction) forControlEvents:UIControlEventTouchDown];

}
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}

- (void)didClickReturnButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didClickBuyButtonAction{
    NSLog(@"buy");
}





@end
