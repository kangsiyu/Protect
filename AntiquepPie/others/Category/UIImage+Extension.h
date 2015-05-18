//
//  UIImage+Extension.h
//  elongBus
//
//  Created by user on 15/2/6.
//  Copyright (c) 2015年 EL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *)resizedImageNamed:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;

+ (UIImage *)resizedImageNamed:(NSString *)name;


@end
