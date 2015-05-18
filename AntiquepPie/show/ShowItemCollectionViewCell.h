//
//  ShowItemCollectionViewCell.h
//  AntiquepPie
//
//  Created by 张超 on 15/5/15.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowItemCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *cellImageView;    //物品图片

@property (strong, nonatomic) UILabel *name ;    // 物品名称

@property (strong, nonatomic) UILabel *clicknum;    //删除按钮

@property (strong, nonatomic) UIButton *shareButton;  //修改按钮

@end
