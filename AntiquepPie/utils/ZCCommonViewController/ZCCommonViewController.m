//
//  ZCCommonViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/14.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCCommonViewController.h"
#import "UIbarbutton_init.h"

@interface ZCCommonViewController ()

@end

@implementation ZCCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    
    //设置导航栏左侧“返回”按钮
    UIButton *fanhui = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    [fanhui addTarget:self action:@selector(didClickReturnButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"returnback" ofType:@"png"]];
    image = [self reSizeImage:image toSize:CGSizeMake(13.0f, 25.0f)];
    
    [fanhui setImage:image forState:UIControlStateNormal];
    [fanhui setTitle:@" 返回" forState:UIControlStateNormal];
    fanhui.titleLabel.font = [UIFont systemFontOfSize:20];
    
    fanhui.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    fanhui.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:fanhui];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    //导航条右侧的个人中心按钮
    UIImageView *navibackcolor = [[UIImageView alloc] init];
    [navibackcolor setBackgroundColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"right.png" highlightedIcon:@"right.png" target:self action:@selector(Mine)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickReturnButtonAction
{
    [self.navigationController popViewControllerAnimated:NO];
}


-(void) Mine{
    NSLog(@"跳");
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
