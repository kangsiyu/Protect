//
//  TeasureListViewController.h
//  AntiquepPie
//
//  Created by 张超 on 15/5/14.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeasureListViewController : UICollectionViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSArray *)array;

@property(strong, nonatomic) NSArray *cellTitles;
@end
