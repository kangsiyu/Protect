//
//  MarketController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/7.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "PlayController.h"
#import "UIbarbutton_init.h"
#import "ChooseCategoryController.h"
#import "TestController.h"



#define dishmargin 3
#define balloonwidth 70
#define balloonheight 80
@interface PlayController ()

@end

@implementation PlayController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    /**         添加导航栏         **/
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"left.png" highlightedIcon:@"left.png" target:self action:@selector(sendStatus)];
    
    self.navigationItem.title = @"文  顽  派";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:24],UITextAttributeFont, nil]];
    //self.navigationItem.title
    UIImageView *navibackcolor = [[UIImageView alloc] init];
    [navibackcolor setBackgroundColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"right.png" highlightedIcon:@"right.png" target:self action:@selector(popMenu)];
    
    /**   添加盘子和气球按钮   **/
    UIImageView *dishview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dish.png"]];
    UIButton *addballoon = [UIButton buttonWithType:UIButtonTypeCustom];
    [addballoon addTarget:self action:@selector(choosecategory:) forControlEvents:UIControlEventTouchUpInside];
    [addballoon setImage: [UIImage imageNamed:@"balloon.png"] forState:UIControlStateNormal];
    [addballoon setBackgroundColor:[UIColor whiteColor]];
    addballoon.hidden = NO;
    CGRect market_screen = [[UIScreen mainScreen] bounds];
    CGFloat market_screen_center_x = market_screen.size.width/2+dishmargin;
    CGFloat market_screen_center_y = market_screen.size.height/2;
    dishview.center = CGPointMake(market_screen_center_x, market_screen_center_y);
    //addballoon.center = CGPointMake(market_screen_center_x, market_screen_center_y-dishview.frame.size.height/2 - addballoon.frame.size.height/2);
    addballoon.frame = CGRectMake(market_screen_center_x - balloonwidth/2, dishview.frame.origin.y - balloonheight-dishmargin, balloonwidth, balloonheight);
    [self.view addSubview:dishview];
    [self.view addSubview:addballoon];
    //NSLog(@"%d",self.view.subviews.count);
    
}
- (IBAction)choosecategory:(UIButton *)sender{
    ChooseCategoryController *choosecategoryview = [[ChooseCategoryController alloc] initWithNibName:@"ChooseCategoryController" bundle:nil];
    
    //[self.navigationController presentViewController:choosecategoryview animated:YES completion:^{}];
    [self.navigationController pushViewController:choosecategoryview animated:nil];
    
    
    
    //TestController *test = [[TestController alloc] initWithNibName:test bundle:nil];
    //[self.navigationController pushViewController:test animated:YES];
}




@end