//
//  MyAuctionViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/14.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "MyAuctionViewController.h"
#import "UIbarbutton_init.h"

@interface MyAuctionViewController ()

@end

@implementation MyAuctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置标题
    [self.navigationItem setTitle:@"我的拍卖"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:24],UITextAttributeFont, nil]];
    
    //定义间隙
    UIView *upEdge = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SIZEWIDTH, 20)];
    upEdge.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:upEdge];
    
    //定义选项卡
    UIButton *btn_table_first = [[UIButton alloc] initWithFrame:CGRectMake(0, 84, SIZEWIDTH/2-1, 26)];
    [btn_table_first setBackgroundColor:[UIColor whiteColor]];
    [btn_table_first setTitle:@"拍卖中" forState:UIControlStateNormal];
    [btn_table_first setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *btn_table_second = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/2, 84, SIZEWIDTH/2-1, 26)];
    [btn_table_second setBackgroundColor:[UIColor whiteColor]];
    [btn_table_second setTitle:@"已拍出" forState:UIControlStateNormal];
    [btn_table_second setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn_table_first];
    [self.view addSubview:btn_table_second];
    
    UIView *downEdge = [[UIView alloc] initWithFrame:CGRectMake(0, 110, SIZEWIDTH, 20)];
    downEdge.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downEdge];
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
