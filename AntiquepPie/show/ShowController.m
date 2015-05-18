//
//  ShowController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/7.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ShowController.h"
#import "UIbarbutton_init.h"
#import "LKPageView.h"
#import "MyConfig.h"
#import "MainTabView.h"
#import "IshowViewController.h"
#import "ShowItemsViewController.h"

#define zcTitleRatio 0.5

@interface ShowController ()<MainTabDelegate>{
    MainTabView* _maintabview;
}

@property (nonatomic,retain)UITableView  * showTableView;

@end

@implementation ShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //设置页面内不能拖动
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    
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
    
    
    //轮播图
    NSMutableArray* pagearray = [NSMutableArray arrayWithCapacity:5];
    for (int i = 1 ; i <= 2; i++) {
        [pagearray addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"page%d",i] ofType:@"png"]];
    }
    
    LKPageView* page = [[LKPageView alloc]initWithPathStringArray:pagearray andFrame:CGRectMake(0, 64,SIZEWIDTH,SIZEHEIGHT/5)];
    
    [self.view addSubview:page];
    
    
    //选择按钮
    MainTabView* maintabview = [[MainTabView alloc] init];
    maintabview.frame = CGRectMake(0, SIZEHEIGHT/5 + 64, self.view.frame.size.width, self.view.frame.size.height/5);
    maintabview.delegate = self;
    [maintabview setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    NSArray  * icons = [[NSArray alloc] initWithObjects:@"show_index_showhouse_normal.png",@"show_index_mostlike_normal.png",@"show_index_ishow_normal.png", nil];
    NSArray  * selected = [[NSArray alloc] initWithObjects:@"show_index_showhouse_pressed.png",@"show_index_mostlike_pressed.png",@"show_index_ishow_pressed.png", nil];
    NSArray  * titles = [[NSArray alloc] initWithObjects:@"秀宝大厅",@"最佳人气",@"我要秀宝", nil];
    
    [maintabview addItemWithArray:icons selectedIcon:selected title:titles titleRatio:zcTitleRatio];

    [self.view addSubview:maintabview];
    
    
    //定义分割线
    UIView *upEdge = [[UIView alloc] initWithFrame:CGRectMake(0, maintabview.frame.origin.y+maintabview.frame.size.height, SIZEWIDTH, 1)];
    upEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    [self.view addSubview:upEdge];
    
    
#pragma marks 商品展示
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH*0.45,SIZEWIDTH*0.45+50);
    CGFloat paddingY = 20;
    CGFloat paddingX = SIZEWIDTH/30;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    
    //CollectionView *collectionVC = [[CollectionView alloc] initWithFrame:CGRectMake(0, tableView.frame.origin.y+tableView.frame.size.height-paddingY, SIZEWIDTH, SIZEHEIGHT-tableView.frame.origin.y-tableView.frame.size.height) collectionViewLayout:flowLayout];
    ShowItemsViewController *collectionVC = [[ShowItemsViewController alloc]initWithCollectionViewLayout:flowLayout];
    collectionVC.collectionView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    collectionVC.collectionView.frame = CGRectMake(0, upEdge.frame.origin.y+upEdge.frame.size.height, SIZEWIDTH, SIZEHEIGHT-upEdge.frame.origin.y-upEdge.frame.size.height);
    
    
    
    [self addChildViewController:collectionVC];
    [self.view addSubview:collectionVC.collectionView];
    
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



#pragma mark dock的代理方法
- (void)mainTab:(MainTabView *)maintab itemSelected:(NSInteger)index
{
    switch (index) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            [self ishow];
            break;
            
        default:
            break;
    }
}




//处理我要秀宝
- (void)ishow
{
    /*
    IshowViewController *ishow = [[IshowViewController alloc]init];
    [self.navigationController pushViewController:ishow animated:NO];
     */
    
    IshowViewController *ishow = [[IshowViewController alloc]init];
    // 设置效果
    [ishow setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    // 底部向上  UIModalTransitionStyleCoverVertical
    // 淡入     UIModalTransitionStyleCrossDissolve
    // 翻转     UIModalTransitionStyleFlipHorizontal
    // 翻半页   UIModalTransitionStylePartialCurl
    
    // 跳转
    [self presentViewController:ishow animated:YES completion:nil];
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

@end
