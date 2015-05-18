//
//  ShowItemsViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/13.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ShowItemsViewController.h"
#import "ItemShowViewController.h"
#import "ShowItemCollectionViewCell.h"

#define cellmargin 3

@interface ShowItemsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end


@implementation ShowItemsViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // Register cell classes
    
    [self.collectionView registerClass:[ShowItemCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return market_cell_num;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //获得cell
    ShowItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //添加imageView左上角的标签
    UIImage *rankImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"show_index_position_bg" ofType:@"png"]];
    rankImage = [self reSizeImage:rankImage toSize:CGSizeMake(cell.frame.size.width/4, cell.frame.size.width/4)];
    UIView *rankView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width/4, cell.frame.size.width/4)];
    rankView.backgroundColor = [UIColor colorWithPatternImage:rankImage];
    
    [cell.cellImageView addSubview:rankView];
    
    cell.name.text = @"龙牌战国红";
    cell.clicknum.text = @"点击:20000次";
    cell.clicknum.font = [UIFont systemFontOfSize:14];
    [cell.shareButton addTarget:self action:@selector(didClickShareButton) forControlEvents:UIControlEventTouchDown];
    
    
    return cell;
}

- (void) didClickShareButton
{
    NSLog(@"click share");
}

#pragma mark <UICollectionViewDelegate>


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemShowViewController *itemshow = [[ItemShowViewController alloc]init];
    // 设置效果
    [itemshow setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:itemshow animated:YES completion:nil];
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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


/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
