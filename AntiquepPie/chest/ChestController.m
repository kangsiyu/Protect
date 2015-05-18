//
//  ChestController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/7.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ChestController.h"
#import "UIBarButton_init.h"
#import "MyAuctionViewController.h"
#import "MyCollectionViewController.h"
#import "MyShowViewController.h"
#import "MyTeasureViewController.h"

@interface ChestController ()

@end

@implementation ChestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    
    //设置标题
    [self.navigationItem setTitle:@"宝箱"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:24],UITextAttributeFont, nil]];
    
    //设置导航栏左侧“返回”按钮
    UIButton *fanhui = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    [fanhui addTarget:self action:@selector(didClickReturnButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"returnback" ofType:@"png"]];
    image = [self reSizeImage:image toSize:CGSizeMake(13.0f, 25.0f)];
    
    [fanhui setImage:image forState:UIControlStateNormal];
    [fanhui setTitle:@" 返回" forState:UIControlStateNormal];
    fanhui.titleLabel.font = [UIFont systemFontOfSize:20];
    
    fanhui.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    fanhui.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:fanhui];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    //导航条右侧的个人中心按钮
    UIImageView *navibackcolor = [[UIImageView alloc] init];
    [navibackcolor setBackgroundColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"right.png" highlightedIcon:@"right.png" target:self action:@selector(Mine)];
    
    //主视图
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SIZEWIDTH, SIZEHEIGHT/4)];
    mainView.backgroundColor = [UIColor colorWithRed:199.0/255.0 green:199.0/255.0 blue:199.0/255.0 alpha:1.0];
    [self.view addSubview:mainView];
    
    UIImage *photo_bg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"box_index_photo_bg" ofType:@"png"]];
    photo_bg = [self reSizeImage:photo_bg toSize:CGSizeMake(SIZEHEIGHT/8, SIZEHEIGHT/8)];
    UIImageView *photoView = [[UIImageView alloc] initWithFrame:CGRectMake(SIZEWIDTH/2-SIZEWIDTH/10, SIZEHEIGHT/16-10, SIZEHEIGHT/8, SIZEHEIGHT/8)];
    photoView.backgroundColor = [UIColor colorWithPatternImage:photo_bg];
    [mainView addSubview:photoView];
    
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SIZEHEIGHT*0.1875, SIZEWIDTH, 20)];
    usernameLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    usernameLabel.font            = [UIFont  systemFontOfSize:20];  //设置文本字体与大小

    usernameLabel.textAlignment   = NSTextAlignmentCenter;
    usernameLabel.text = @"守龙斋";
    [mainView addSubview:usernameLabel];
    
    
    
    //下面的4个按钮
    CGFloat baseY = 64+SIZEHEIGHT/4;
    CGFloat marginX = SIZEWIDTH / 10;
    CGFloat marginY = SIZEHEIGHT / 16;
    CGFloat width = SIZEWIDTH * 0.35;
    CGFloat height = SIZEHEIGHT / 6;
    
    //我的宝贝 按钮
    UIButton *treasure = [[UIButton alloc] initWithFrame:CGRectMake(marginX, baseY+marginY, width, height)];
    [treasure addTarget:self action:@selector(didClickMyTeasureButtonAction) forControlEvents:UIControlEventTouchUpInside];

    UIImage *treasureImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"box_index_my_treasure" ofType:@"png"]];
    treasureImage = [self reSizeImage:treasureImage toSize:CGSizeMake(width, height)];
    [treasure setImage:treasureImage forState:UIControlStateNormal];
    [self.view addSubview:treasure];
    
    //我的秀宝 按钮
    UIButton *show = [[UIButton alloc] initWithFrame:CGRectMake(marginX*2+width, baseY+marginY, width, height)];
    [show addTarget:self action:@selector(didClickMyShowButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIImage *showImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"box_index_my_show" ofType:@"png"]];
    showImage = [self reSizeImage:showImage toSize:CGSizeMake(width, height)];
    [show setImage:showImage forState:UIControlStateNormal];
    [self.view addSubview:show];
    
    
    //我的拍卖 按钮
    UIButton *auction = [[UIButton alloc] initWithFrame:CGRectMake(marginX, baseY+2*marginY+height, width, height)];
    [auction addTarget:self action:@selector(didClickMyAuctionButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIImage *auctionImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"box_index_my_auction" ofType:@"png"]];
    auctionImage = [self reSizeImage:auctionImage toSize:CGSizeMake(width, height)];
    [auction setImage:auctionImage forState:UIControlStateNormal];
    [self.view addSubview:auction];
    
    //我的收藏 按钮
    UIButton *collection = [[UIButton alloc] initWithFrame:CGRectMake(marginX*2+width, baseY+2*marginY+height, width, height)];
    [collection addTarget:self action:@selector(didClickMyCollectionButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIImage *collectionImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"box_index_my_collection" ofType:@"png"]];
    collectionImage = [self reSizeImage:collectionImage toSize:CGSizeMake(width, height)];
    [collection setImage:collectionImage forState:UIControlStateNormal];
    [self.view addSubview:collection];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)didClickReturnButtonAction
{
    UIViewController *oldVc = self.childViewControllers[1];
    [oldVc.view removeFromSuperview];
    
    // 1.取出即将显示的控制器
    UIViewController *newVc = self.childViewControllers[2];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height*0.3;
    newVc.view.frame = CGRectMake(0, 0, width, height);
    
    // 2.添加新控制器的view到MainController上面
    [self.view addSubview:newVc.view];
    
}


-(void) Mine{
    NSLog(@"跳");
}


- (void) didClickMyTeasureButtonAction
{
    MyTeasureViewController *show = [[MyTeasureViewController alloc]init];
    [self.navigationController pushViewController:show animated:NO];
}

- (void) didClickMyAuctionButtonAction
{
    MyAuctionViewController *show = [[MyAuctionViewController alloc]init];
    [self.navigationController pushViewController:show animated:NO];
}

- (void) didClickMyCollectionButtonAction
{
    MyCollectionViewController *show = [[MyCollectionViewController alloc]init];
    [self.navigationController pushViewController:show animated:NO];
}

- (void) didClickMyShowButtonAction
{
    MyShowViewController *show = [[MyShowViewController alloc]init];
    [self.navigationController pushViewController:show animated:NO];
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
