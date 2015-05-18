//
//  ZCButton.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/11.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCButton.h"

#define kTitleRatio 0.2

@implementation ZCButton

-(id)init
{
    self = [super init];
    if (self) {
        // 1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        
        // 3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
    }
    return self;
}


#pragma mark 覆盖父类在highlighted时的所有操作
- (void)setHighlighted:(BOOL)highlighted {
    //    [super setHighlighted:highlighted];
}

#pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * (1-kTitleRatio);
    
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height*(1-kTitleRatio) - 10;
    
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

@end
