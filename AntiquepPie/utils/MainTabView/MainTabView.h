//
//  MainTabView.h
//  AntiquepPie
//
//  Created by 张超 on 15/5/11.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTabView;

@protocol MainTabDelegate <NSObject>
@optional
-(void)mainTab:(MainTabView *)maintab itemSelected:(NSInteger)index;
@end

@interface MainTabView : UIView
// 添加一个选项卡
- (void)addItemWithArray:(NSArray *)icons selectedIcon:(NSArray *)selecteds title:(NSArray *)title titleRatio:(CGFloat) myratio;

// 代理
@property (nonatomic, weak) id<MainTabDelegate> delegate;


@end
