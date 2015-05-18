//
//  MainTabView.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/11.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "MainTabView.h"
#import "ZCButton.h"

@interface MainTabView()
{
    ZCButton *_selectedItem;
}
@end

@implementation MainTabView

#pragma mark 添加一个选项卡
- (void)addItemWithArray:(NSArray *)icons selectedIcon:(NSArray *)selecteds title:(NSArray *)titles titleRatio:(CGFloat) myratio
{
    // 1.创建item
    NSInteger buttonnum = icons <= selecteds ? icons.count: selecteds.count;
    
    for (int i = 0; i < buttonnum; i++)
    {
        ZCButton *button = [[ZCButton alloc] init];
        button.tag = i;
        
        CGFloat height = self.frame.size.height;// 高度
        CGFloat width = self.frame.size.width / buttonnum; // 宽度
        CGFloat radius = width > height ? height / 2: width / 2;
        
        button.frame = CGRectMake(width * i, 0 , width, height);
        // 图标
        radius-=20;
        UIImage *image_normal = [UIImage imageNamed:icons[i]];
        image_normal = [self reSizeImage:image_normal toSize:CGSizeMake(radius*2, 2*radius)];
        
        UIImage *image_selected = [UIImage imageNamed:selecteds[i]];
        image_selected = [self reSizeImage:image_selected toSize:CGSizeMake(2*radius, 2*radius)];
        
        
        [button setImage:image_normal forState:UIControlStateNormal];
        [button setImage:image_selected forState:UIControlStateSelected];
       
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
       
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        
        // 监听item的点击
        [button addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
        
        if (i == 0)  //默认选中秀宝大厅
        {
            _selectedItem = button;
            button.selected = true;
        }
        [self addSubview:button];
    }
    
}

#pragma mark 监听item点击
- (void)itemClick:(ZCButton *)item
{
    // 0.通知代理
    if ([_delegate respondsToSelector:@selector(mainTab:itemSelected:)]) {
        [_delegate mainTab:self itemSelected:item.tag];
    }
    
    // 1.取消选中当前选中的item
    _selectedItem.selected = NO;
    
    // 2.选中点击的item
    item.selected = YES;
    
    // 3.赋值
    _selectedItem = item;
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
@end
