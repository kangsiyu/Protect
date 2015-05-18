//
//  UIImage+Extension.m
//  elongBus
//
//  Created by user on 15/2/6.
//  Copyright (c) 2015年 EL. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)resizedImageNamed:(NSString *)name
{
    return [self resizedImageNamed:name leftScale:0.5 topScale:0.5];
}

+ (UIImage *)resizedImageNamed:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftScale topCapHeight:image.size.height * topScale];
}


@end
