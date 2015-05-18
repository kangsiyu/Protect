//
//  ChooseCategoryController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/8.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ChooseCategoryController.h"
#import "UIbarbutton_init.h"
#import "DockController.h"

#define topmaigin 70
@interface ChooseCategoryController ()

@end

@implementation ChooseCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**    背景颜色    **/
    self.view.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    /**    上导航栏    **/
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"left.png" highlightedIcon:@"left.png" target:self action:@selector(sendStatus)];
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:24],UITextAttributeFont, nil]];
    self.navigationItem.title = @"文  顽  派";
    //self.navigationItem.title
    UIImageView *navibackcolor = [[UIImageView alloc] init];
    [navibackcolor setBackgroundColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"right.png" highlightedIcon:@"right.png" target:self action:@selector(popMenu)];
    
    
    /**  分类信息   **/
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat screen_center_x = screen.size.width/2;
    CGFloat screen_center_y = screen.size.height/2;
#warning 屏幕适配问题
    UILabel *firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, topmaigin, 400, 70)];
    [firstlabel setNumberOfLines:1];
    firstlabel.font = [UIFont fontWithName:@"宋体" size:40];
    //firstlabel.textColor = [UIColor blackColor];
    //firstlabel.adjustsFontSizeToFitWidth = YES;
    firstlabel.textAlignment = UITextAlignmentCenter;
    firstlabel.text = @"—————材质品类—————";
    
    
    [self.view addSubview:firstlabel];
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
