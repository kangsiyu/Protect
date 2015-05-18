//
//  ViewController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/6.
//  Copyright (c) 2015年 ksy. All rights reserved.
//


#import "ViewController.h"
#import "Dock.h"
#import "MarketController.h"
#import "ShowController.h"
#import "PlayController.h"
#import "ChestController.h"
#import "DiscoverController.h"
#import "WBNavigationController.h"

#define kDockHeight 44

@interface ViewController () <DockDelegate>
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化所有的子控制器
    [self addAllChildControllers];
    
    // 2.初始化DockItems
    [self addDockItems];
}

#pragma mark 初始化所有的子控制器
- (void)addAllChildControllers
{
    // 1.market
    MarketController *market = [[MarketController alloc] init];
    WBNavigationController *nav1 = [[WBNavigationController alloc] initWithRootViewController:market];
    [self addChildViewController:nav1];
    
    // 2.show
    ShowController *show = [[ShowController alloc] init];
    WBNavigationController *nav2 = [[WBNavigationController alloc] initWithRootViewController:show];
    [self addChildViewController:nav2];
    
    // 3.play
    PlayController *play = [[PlayController alloc] init];
    WBNavigationController *nav3 = [[WBNavigationController alloc] initWithRootViewController:play];
    [self addChildViewController:nav3];
    
    // 4.chest
    ChestController *chest = [[ChestController alloc] init];
    WBNavigationController *nav4 = [[WBNavigationController alloc] initWithRootViewController:chest];
    [self addChildViewController:nav4];
    
    // 5.discover
    DiscoverController *discover = [[DiscoverController alloc] init];
    WBNavigationController *nav5 = [[WBNavigationController alloc] initWithRootViewController:discover];
    [self addChildViewController:nav5];
    
    [self dock:nil itemSelectedFrom:0 to:2];
    
    
}


#pragma mark 添加Dock
- (void)addDockItems
{
    // 1.设置Dock的背景颜色
    _dock.backgroundColor = [UIColor blackColor];
    //2.往Dock里面填充内容
    [_dock addItemWithIcon:@"tabbar_market.png" selectedIcon:@"tabbar_market_selected.png" title:@"集市"itemCategory:@"label"];
    
    [_dock addItemWithIcon:@"tabbar_show.png" selectedIcon:@"tabbar_show.png" title:@"秀宝" itemCategory:@"label"];
    
    [_dock addItemWithIcon:@"tabbar_play.png" selectedIcon:@"tabbar_profile_selected.png" title:nil itemCategory:@"picture"];
    
    
    [_dock addItemWithIcon:@"tabbar_chest.png" selectedIcon:@"chest.png" title:@"宝箱" itemCategory:@"label"];
    
    [_dock addItemWithIcon:@"tabbar_discover.png" selectedIcon:@"tabbar_discover.png"  title:@"发现" itemCategory:@"label"];
}

@end

