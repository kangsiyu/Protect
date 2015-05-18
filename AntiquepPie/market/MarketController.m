//
//  MarketController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/7.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "MarketController.h"
#import "UIbarbutton_init.h"
#import "ChooseCategoryController.h"
#import "TestController.h"
#import "MyConfig.h"
#import "LKPageView.h"
#import "MainTabView.h"
//#import "CommodityViewController.h"
#import "CollectionViewController.h"
//#include "CollectionView.h"


#define zcTitleRatio 0.5
@interface MarketController ()<MainTabDelegate>{
    MainTabView* _maintabview;
}

@property (nonatomic,retain)UITableView  * marketTableView;
@end

@implementation MarketController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    UIScrollView *mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT)];
    
    /* CGRect market_screen = [[UIScreen mainScreen] bounds];
     CGFloat market_screen_center_x = market_screen.size.width/2;
     CGFloat market_screen_center_y = market_screen.size.height/2;*/
    
    /**         添加导航栏         **/
    UIButton *fanhui = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    [fanhui addTarget:self action:@selector(didClickReturnButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"returnback" ofType:@"png"]];
    image = [self reSizeImage:image toSize:CGSizeMake(13.0f, 25.0f)];
    
    [fanhui setImage:image forState:UIControlStateNormal];
    [fanhui setTitle:@" 返回" forState:UIControlStateNormal];
    fanhui.titleLabel.font = [UIFont systemFontOfSize:20];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:fanhui];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    //导航条的搜索条
    //UITextView *searchview = [[UITextView alloc] initWithFrame:CGRectMake((SIZEWIDTH/2)-100,20,200,36)];
    UITextField *searchField= [[UITextField alloc] initWithFrame:CGRectMake((SIZEWIDTH/2)-100,20,200,36)];
    //UITextField *searchField= [[UITextField alloc] initWithFrame:CGRectMake(4,4,190,36)];
    //searchview.editable = NO;
    searchField.textColor= [UIColor whiteColor];
    searchField.font = [UIFont systemFontOfSize:16];
    searchField.tintColor = [UIColor whiteColor];
    searchField.background = [UIImage imageNamed:@"search_normal.png"];
    searchField.backgroundColor= [UIColor blackColor];
    searchField.placeholder = @"搜索";
    //NSDictionary *placeholdcolor = [NSDictionary alloc] initWithObjectsAndKeys:[UIColor whiteColor], nil
    //[searchField placeholder] drawInRect:CGRectMake(SIZEWIDTH, 20, 100, 36) withAttributes:
    
    
    searchField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    [searchField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];// textField的文本发生变化时相应事件
    [searchField setReturnKeyType:UIReturnKeySearch];
    searchField.delegate=self;
 /*   searchField.borderStyle = UITextBorderStyleBezel;
    searchField.layer.borderColor = [[UIColor whiteColor] CGColor];
    searchField.layer.borderWidth = 1.0f;*/
    //[searchview addSubview:searchField];
    [self.navigationController.view addSubview:searchField];
    
    
    //[self.view addSubview:searchField];
    
    //self.navigationItem.title
    UIImageView *navibackcolor = [[UIImageView alloc] init];
    [navibackcolor setBackgroundColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"right.png" highlightedIcon:@"right.png" target:self action:@selector(Mine)];
    
    
    //轮播图
    NSMutableArray* pagearray = [NSMutableArray arrayWithCapacity:5];
    for (int i = 1 ; i <= 2; i++) {
        [pagearray addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"page%d",i] ofType:@"png"]];
    }
    
    LKPageView* page = [[LKPageView alloc]initWithPathStringArray:pagearray andFrame:CGRectMake(0, 64,SIZEWIDTH,SIZEHEIGHT/5)];
    
    [mainView addSubview:page];
    
    
    //选择按钮
    MainTabView* maintabview = [[MainTabView alloc] init];
    maintabview.frame = CGRectMake(0, SIZEHEIGHT/5 + 64, self.view.frame.size.width, self.view.frame.size.height/5);
    maintabview.delegate = self;
    [maintabview setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
    NSArray  * icons = [[NSArray alloc] initWithObjects:@"market_index_market_pressed.png",@"market_index_sell_normal.png",@"market_index_best_normal.png", nil];
    NSArray  * selected = [[NSArray alloc] initWithObjects:@"market_index_market_pressed.png",@"market_index_sell_normal.png",@"market_index_best_normal.png", nil];
    NSArray  * titles = [[NSArray alloc] initWithObjects:@"文玩集市",@"文玩拍卖",@"精品专场", nil];
    
    [maintabview addItemWithArray:icons selectedIcon:selected title:titles titleRatio:zcTitleRatio];
    


    
 
    [mainView addSubview:maintabview];
    
  
    
    //选择按钮 布局
    UIView  * tableView = [[UIView alloc] initWithFrame:CGRectMake(0, SIZEHEIGHT-(SIZEHEIGHT/5*3)+64, self.view.frame.size.width,50)];
    tableView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    //定义上下边缘
    UIView *upEdge = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 1)];
    UIView *downEdge = [[UIView alloc] initWithFrame:CGRectMake(0,48, SIZEWIDTH, 1)];
    upEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    downEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    //选项数量
    int tableButtonCount = 3;
    //定义间隙
    UIView *leftEdge = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH/tableButtonCount-1, 6, 1, 36)];
    leftEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    UIView *rightEdge = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH/tableButtonCount + SIZEWIDTH/tableButtonCount-1, 6, 1, 36)];
    rightEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    //定义选项卡
    UIButton *market_btn_table_first = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH/tableButtonCount-1, 50)];
    //market_btn_table_first.backgroundColor = [UIColor greenColor];
    //[market_btn_table_first setTitle:@"材质" forState:UIControlStateNormal];
    //[market_btn_table_first.titleLabel setTextColor:[UIColor blackColor]];
    [market_btn_table_first setTitle:@"材质" forState:UIControlStateNormal];
    [market_btn_table_first setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *market_btn_table_second = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/tableButtonCount, 0, SIZEWIDTH/tableButtonCount-1, 50)];
    //market_btn_table_second.backgroundColor = [UIColor blueColor];
    [market_btn_table_second setTitle:@"款式" forState:UIControlStateNormal];
    [market_btn_table_second setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *market_btn_table_third = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH-SIZEWIDTH/tableButtonCount, 0, SIZEWIDTH/tableButtonCount-1, 50)];
    //market_btn_table_third.backgroundColor = [UIColor yellowColor];
    [market_btn_table_third setTitle:@"价格" forState:UIControlStateNormal];
    [market_btn_table_third setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [tableView addSubview:upEdge];
    [tableView addSubview:downEdge];
    [tableView addSubview:market_btn_table_first];
    [tableView addSubview:leftEdge];
    [tableView addSubview:rightEdge];
    [tableView addSubview:market_btn_table_second];
    [tableView addSubview:market_btn_table_third];
    [mainView addSubview:tableView];

#pragma marks 商品展示
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH*0.45,SIZEWIDTH*0.6);
    CGFloat paddingY = 20;
    CGFloat paddingX = SIZEWIDTH/30
    ;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    
    //CollectionView *collectionVC = [[CollectionView alloc] initWithFrame:CGRectMake(0, tableView.frame.origin.y+tableView.frame.size.height-paddingY, SIZEWIDTH, SIZEHEIGHT-tableView.frame.origin.y-tableView.frame.size.height) collectionViewLayout:flowLayout];
    CollectionViewController *collectionVC = [[CollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
    collectionVC.collectionView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    collectionVC.collectionView.frame = CGRectMake(0, tableView.frame.origin.y+tableView.frame.size.height, SIZEWIDTH, SIZEHEIGHT-tableView.frame.origin.y-tableView.frame.size.height);

    
    
    [self addChildViewController:collectionVC];
    [mainView addSubview:collectionVC.collectionView];
    mainView.contentSize = CGSizeMake(SIZEWIDTH, collectionVC.view.frame.origin.y+collectionVC.view.frame.size.height);
    [self.view addSubview:mainView];
    
 
    
}

- (BOOL)textFieldShouldReturn:(UITextField*)theTextField {
    [theTextField resignFirstResponder];
    NSLog(@"do something what you want");
    return YES;
}

- (void) textFieldDidChange:(UITextField*) TextField{
    NSLog(@"textFieldDidChange textFieldDidChange");
    TextField.background = [UIImage imageNamed:@"search_pressed"];
    
}

-(void) Mine{
    NSLog(@"跳");
    
}
- (void)segmentControlButtonAction:(UISegmentedControl *)seg
{
    NSInteger  index = [seg selectedSegmentIndex];
    
    switch (index) {
        case 0:
            NSLog(@"1");
            break;
        case 1:
            NSLog(@"2");
            break;
        case 2:
            NSLog(@"3");
            break;
            
        default:
            break;
    }
    
}


#pragma mark dock的代理方法
- (void)mainTab:(MainTabView *)maintab itemSelectedFrom:(int)from to:(int)to
{
    if (to < 0 || to >= self.childViewControllers.count) return;
    
    // 0.移除旧控制器的view
    UIViewController *oldVc = self.childViewControllers[from];
    [oldVc.view removeFromSuperview];
    
    // 1.取出即将显示的控制器
    UIViewController *newVc = self.childViewControllers[to];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height*0.3;
    newVc.view.frame = CGRectMake(0, 0, width, height);
    
    // 2.添加新控制器的view到MainController上面
    [self.view addSubview:newVc.view];
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

- (void)didClickReturnButtonAction:(UIBarButtonItem *)button
{
}





@end