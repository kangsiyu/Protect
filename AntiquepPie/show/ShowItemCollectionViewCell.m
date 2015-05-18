//
//  ShowItemCollectionViewCell.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/15.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ShowItemCollectionViewCell.h"

#define cellmargin 3

@implementation ShowItemCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    //物品主视图
    self.backgroundColor = [UIColor whiteColor];
    _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    _cellImageView.backgroundColor = [UIColor grayColor];
    
    
    
    //标题和点击次数
    _name = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/30, self.frame.size.width+cellmargin, self.frame.size.width*0.7, 20)];
    _clicknum = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/30, self.frame.size.height - 20 - 2*cellmargin, self.frame.size.width*0.7,20)];
    
    
    
    //分享按钮
    _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - self.frame.size.width*0.25, self.frame.size.width+cellmargin, self.frame.size.width*0.25, self.frame.size.height-self.frame.size.width-2*cellmargin)];
    
    UIImage *shareimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"show_index_showshare" ofType:@"png"]];
    shareimage = [self reSizeImage:shareimage toSize:CGSizeMake(20, 20)];
    
    [_shareButton setImage:shareimage forState:UIControlStateNormal];
    [_shareButton setTitle:@" 分享" forState:UIControlStateNormal];
    _shareButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [_shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _shareButton.imageEdgeInsets = UIEdgeInsetsMake(-18, (_shareButton.bounds.size.width-_shareButton.imageView.bounds.size.width)/2, 0, 0);
    _shareButton.titleEdgeInsets = UIEdgeInsetsMake(_shareButton.imageView.bounds.size.height,-_shareButton.imageView.bounds.size.width,0,0);
    
    
    
    [self addSubview:_cellImageView];
    [self addSubview:_name];
    [self addSubview:_clicknum];
    [self addSubview:_shareButton];
    
    return self;
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
