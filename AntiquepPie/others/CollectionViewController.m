//
//  CollectionViewController.m
//  text123
//
//  Created by user on 15/5/12.
//  Copyright (c) 2015年 w.z.g. All rights reserved.
//

#import "CollectionViewController.h"
#import "MyConfig.h"
#import "marketItemDetailViewController.h"

#define cellmargin 3

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // Register cell classes
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    

    cell.backgroundColor = [UIColor whiteColor];
    UIImageView *cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.width)];
    UILabel *cellLabelName = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/30, cell.frame.size.width+cellmargin, cell.frame.size.width, cell.frame.size.width/8)];
    UILabel *cellLabelPrize = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/30, cell.frame.size.height - cell.frame.size.width/8 -cellmargin, cell.frame.size.width*0.6,cell.frame.size.width/8)];
    UIButton *cellBtn = [[UIButton alloc] initWithFrame:CGRectMake(cell.frame.size.width - cell.frame.size.width*0.2, cell.frame.size.height - cell.frame.size.width/8 - 2*cellmargin, cell.frame.size.width*0.2, cell.frame.size.width/7)];
    cellImageView.backgroundColor = [UIColor grayColor];
    cellLabelName.text = @"和兰玉青白玉挂件";
    cellLabelPrize.text = @"￥ 1.3万";
    //cellBtn.backgroundColor = [UIColor greenColor];
    [cellBtn setImage:[UIImage imageNamed:@"market_index_talk"] forState:UIControlStateNormal];
    [cellBtn setTitle:@"1" forState:UIControlStateNormal];
    
    [cell addSubview:cellImageView];
    [cell addSubview:cellLabelName];
    [cell addSubview:cellLabelPrize];
    [cell addSubview:cellBtn];
    
    
    return cell;
    
}

#pragma mark <UICollectionViewDelegate>


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    marketItemDetailViewController *marketitem = [[marketItemDetailViewController alloc] init];
    [marketitem setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    // 底部向上  UIModalTransitionStyleCoverVertical
    // 淡入     UIModalTransitionStyleCrossDissolve
    // 翻转     UIModalTransitionStyleFlipHorizontal
    // 翻半页   UIModalTransitionStylePartialCurl
    
    // 跳转
    [self presentViewController:marketitem animated:YES completion:nil];
    cell.backgroundColor = [UIColor greenColor];
    
    
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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
