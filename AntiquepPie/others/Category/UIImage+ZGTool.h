//
//  UIImage+ZGTool.h
//  0904图片截屏
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 wzg.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZGTool)

/**
 *  截图
 *
 *  @param view 截取当前view视图
 */
+ (instancetype)imageWithCaptureView:(UIView *)view;

/**
 *  头像裁图
 *
 *  @param name   头像图片
 *  @param border 头像边环
 *  @param color  边环颜色
 */
+ (instancetype)imageTailorWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color;

/**
 *  打水印
 *
 *  @param name 原图
 *  @param logo 水印
 */
+ (instancetype)imageWaterImageWithBg:(NSString *)name logo:(NSString *)logo;
@end
