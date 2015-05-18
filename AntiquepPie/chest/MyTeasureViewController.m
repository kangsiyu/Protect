//
//  MyTeasureViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/14.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "MyTeasureViewController.h"
#import "UIbarbutton_init.h"
#import "TeasureListViewController.h"

@interface MyTeasureViewController ()

@end

@implementation MyTeasureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //设置标题
    [self.navigationItem setTitle:@"我的宝贝"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:24],UITextAttributeFont, nil]];
    
    //定义间隙
    UIView *upEdge = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SIZEWIDTH, 20)];
    upEdge.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:upEdge];
    
    //定义选项卡
    UIButton *btn_table_first = [[UIButton alloc] initWithFrame:CGRectMake(0, 84, SIZEWIDTH/2-1, 26)];
    [btn_table_first setBackgroundColor:[UIColor whiteColor]];
    [btn_table_first setTitle:@"我要上传" forState:UIControlStateNormal];
    [btn_table_first setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *btn_table_second = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/2, 84, SIZEWIDTH/2-1, 26)];
    [btn_table_second setBackgroundColor:[UIColor whiteColor]];
    [btn_table_second setTitle:@"管理宝贝" forState:UIControlStateNormal];
    [btn_table_second setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn_table_first];
    [self.view addSubview:btn_table_second];

    UIView *downEdge = [[UIView alloc] initWithFrame:CGRectMake(0, 110, SIZEWIDTH, 20)];
    downEdge.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downEdge];
    
    
#pragma marks 宝贝展示
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH*0.45,SIZEWIDTH*0.45+50);
    CGFloat paddingY = 20;
    CGFloat paddingX = SIZEWIDTH/30;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    
    
    NSArray* titleArray = [[NSArray alloc] initWithObjects:@"战国红玛瑙1", @"和田玉青田玉摆件1",@"战国红玛瑙2",@"和田玉青田玉摆件2",@"战国红玛瑙3",@"和田玉青田玉摆件3",nil];
    TeasureListViewController *collectionVC = [[TeasureListViewController alloc]initWithCollectionViewLayout:flowLayout source:titleArray];
    collectionVC.collectionView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    collectionVC.collectionView.frame = CGRectMake(0, 130, SIZEWIDTH, SIZEHEIGHT-130);
    
    
    
    [self addChildViewController:collectionVC];
    [self.view addSubview:collectionVC.collectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)didClickReturnButtonAction
{
    [self.navigationController popViewControllerAnimated:NO];
}


-(void) Mine{
    NSLog(@"跳");
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
