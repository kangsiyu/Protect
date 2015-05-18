//
//  IshowViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/12.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "IshowViewController.h"
#import "VideoViewController.h"

@interface IshowViewController ()

@end

@implementation IshowViewController

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didClickCancelButton) name:@"backback" object:nil];
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    
    CGFloat margin = SIZEHEIGHT/10;
    CGFloat buttonwidth = SIZEWIDTH*5/9;
    CGFloat buttonheight = SIZEHEIGHT/10;
    
    UIButton *video = [[UIButton alloc] initWithFrame:CGRectMake((SIZEWIDTH-buttonwidth)/2, SIZEHEIGHT/2-buttonheight-margin/2, buttonwidth, buttonheight)];
    video.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:171.0/255.0 blue:71.0/255.0 alpha:1.0];
    [video setTitle:@"自 拍" forState:UIControlStateNormal];
    [video addTarget:self action:@selector(didClickVideoButton) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:video];
    
    UIButton *breturn = [[UIButton alloc] initWithFrame:CGRectMake((SIZEWIDTH-buttonwidth)/2, SIZEHEIGHT/2+margin/2, buttonwidth, buttonheight)];
    breturn.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:171.0/255.0 blue:71.0/255.0 alpha:1.0];
    [breturn setTitle:@"取 消" forState:UIControlStateNormal];
    [breturn addTarget:self action:@selector(didClickCancelButton) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:breturn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didClickVideoButton {
    VideoViewController *video = [[VideoViewController alloc]init];
    // 设置效果
    [video setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    // 底部向上  UIModalTransitionStyleCoverVertical
    // 淡入     UIModalTransitionStyleCrossDissolve
    // 翻转     UIModalTransitionStyleFlipHorizontal
    // 翻半页   UIModalTransitionStylePartialCurl
    
    // 跳转
    [self presentViewController:video animated:YES completion:nil];
   
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
