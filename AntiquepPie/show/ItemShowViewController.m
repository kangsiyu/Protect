//
//  ItemShowViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/12.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ItemShowViewController.h"

@interface ItemShowViewController ()

@end

@implementation ItemShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    
    UIView *nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 64)];
    nav.backgroundColor = [UIColor blackColor];
    
    //设置导航条文字
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, SIZEWIDTH-200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font            = [UIFont  systemFontOfSize:25];  //设置文本字体与大小
    titleLabel.textColor       = [UIColor whiteColor];  //设置文本颜色
    titleLabel.textAlignment   = NSTextAlignmentCenter;
    titleLabel.text = @"秀宝大厅";
    
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
    
    
    //设置导航栏右侧“分享”按钮
    UIButton *shareButton = [[UIButton alloc]initWithFrame:CGRectMake(SIZEWIDTH-100, 0, 100, 64)];
    [shareButton addTarget:self action:@selector(didClickShareButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *shareimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"show_item_share" ofType:@"png"]];
    shareimage = [self reSizeImage:shareimage toSize:CGSizeMake(25.0f, 35.0f)];
    
    [shareButton setImage:shareimage forState:UIControlStateNormal];
    [shareButton setTitle:@" 分享" forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    shareButton.titleEdgeInsets = UIEdgeInsetsMake(26.5, -shareimage.size.width-10, 5, 13);
    shareButton.imageEdgeInsets = UIEdgeInsetsMake(26.5, shareButton.titleLabel.bounds.size.width,5,-100);
    
    
    [nav addSubview:shareButton];
    [self.view addSubview:nav];
    
    
    //播放视频view
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SIZEWIDTH, SIZEHEIGHT*0.3)];
    videoView.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0];
    [self.view addSubview:videoView];
    
}


- (void)didClickReturnButtonAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didClickShareButtonAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//重新设置UIImage的长宽
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
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
