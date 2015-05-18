//
//  TeasureListViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/14.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "TeasureListViewController.h"

#define cellmargin 3
#define numOfRow 2

@interface TeasureListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation TeasureListViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSArray *)array
{
    self = [super initWithCollectionViewLayout:layout];
    _cellTitles = array;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // Register cell classes
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return numOfRow;
    return _cellTitles.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //return (_cellTitles.count-1) / numOfRow + 1;
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    //物品主视图
    cell.backgroundColor = [UIColor whiteColor];
    UIImageView *cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.width)];
    cellImageView.backgroundColor = [UIColor grayColor];
    
    
    //标题和点击次数
    UILabel *cellLabelName = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/30, cell.frame.size.width+cellmargin, cell.frame.size.width, 20)];
    cellLabelName.text = [_cellTitles objectAtIndex:indexPath.row+numOfRow*indexPath.section];
    
    NSLog(@"%@", [_cellTitles objectAtIndex:indexPath.row+numOfRow*indexPath.section]);
    NSLog(@"%ld", indexPath.row+numOfRow*indexPath.section);
    NSLog(@"%@",cellLabelName.text);
    
    //NSLog(@"item======%ld",indexPath.item);
    //NSLog(@"row=======%ld",indexPath.row);
    //NSLog(@"section===%ld",indexPath.section);
    
    
    //删除按钮
    UIButton *delButton = [[UIButton alloc] initWithFrame:CGRectMake(cell.frame.size.width/30, cellLabelName.frame.origin.y+20+cellmargin, 50, 20)];
    
    UIImage *delimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"btn_delete" ofType:@"png"]];
    delimage = [self reSizeImage:delimage toSize:CGSizeMake(14, 14)];
    
    [delButton setImage:delimage forState:UIControlStateNormal];
    [delButton setTitle:@"删除" forState:UIControlStateNormal];
    delButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [delButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    delButton.imageEdgeInsets = UIEdgeInsetsMake(0, delButton.imageView.bounds.size.width+15 , 0, 0);
    delButton.titleEdgeInsets = UIEdgeInsetsMake(0, -delButton.imageView.bounds.size.width-20,0,0);
    
    
    //修改按钮
    UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(2*cell.frame.size.width/30+50, cellLabelName.frame.origin.y+20+cellmargin, 50, 20)];
    
    UIImage *editimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"btn_edit" ofType:@"png"]];
    editimage = [self reSizeImage:editimage toSize:CGSizeMake(14, 14)];
    
    [editButton setImage:editimage forState:UIControlStateNormal];
    [editButton setTitle:@"修改" forState:UIControlStateNormal];
    editButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [editButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    editButton.imageEdgeInsets = UIEdgeInsetsMake(0, editButton.imageView.bounds.size.width+15, 0, 0);
    editButton.titleEdgeInsets = UIEdgeInsetsMake(0, -editButton.imageView.bounds.size.width-20,0,0);
    
    
    
    [cell addSubview:cellImageView];
    [cell addSubview:cellLabelName];
    [cell addSubview:delButton];
    [cell addSubview:editButton];
    
    
    return cell;
    
}

#pragma mark <UICollectionViewDelegate>


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
