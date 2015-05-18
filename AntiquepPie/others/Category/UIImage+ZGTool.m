//
//  UIImage+ZGTool.m
//  0904图片截屏
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 wzg.com. All rights reserved.
//

#import "UIImage+ZGTool.h"

@implementation UIImage (ZGTool)

+ (instancetype)imageWithCaptureView:(UIView *)view
{
    //1.开启上下文
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    //2.获取上下文
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:ctx];
    
    //3.截图
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)imageTailorWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color
{
    UIImage *oldImage = [UIImage imageNamed:name];
    
    //大圈
    CGFloat borderW = border;
    CGFloat bigCircleW = oldImage.size.width + 2*borderW;
    CGFloat bigCircleH = oldImage.size.height + 2*borderW;
    
    bigCircleW  =  bigCircleW > bigCircleH ? bigCircleH :bigCircleW;
    CGSize bigCircleSize = CGSizeMake(bigCircleW, bigCircleH);
    //1.开启上下文
    
    UIGraphicsBeginImageContextWithOptions(bigCircleSize, NO, 0);
    
    //2.取得上下文
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3.画圆
    [color setFill];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, bigCircleW, bigCircleH)];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
    
    
    //小圆
    CGContextAddEllipseInRect(ctx, CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height));
    
    //截取
    
    CGContextClip(ctx);
    
    [oldImage drawInRect:CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束
    UIGraphicsEndImageContext();
    
    return newImage;

}

+ (instancetype)imageWaterImageWithBg:(NSString *)name logo:(NSString *)logo
{
    UIImage *oldImage = [UIImage imageNamed:name];
    
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0);
    
    [oldImage drawAtPoint:CGPointZero];
    
    UIImage *waterImage = [UIImage imageNamed:logo];
    CGFloat margin = 5;
    CGFloat scale = 0.2;
    
    CGFloat waterW = waterImage.size.width *scale;
    CGFloat waterH = waterImage.size.height * scale;
    CGFloat waterX = oldImage.size.width - waterW - margin;
    CGFloat waterY = oldImage.size.height - waterH - margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;

}

@end
