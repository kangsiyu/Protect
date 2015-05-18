//
//  marketItemDetailViewController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/13.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "marketItemDetailViewController.h"
#import "UIbarbutton_init.h"
#import "MyConfig.h"
#import "LKPageView.h"
#import "MainTabView.h"
#import "BuyMainViewController.h"
#import "ServiceTalkTableViewController.h"

@interface marketItemDetailViewController ()
@property (weak,nonatomic) UIScrollView *itemmainview;
@end

@implementation marketItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark 把页面的view包装在scrollerview中
    UIScrollView *itemmainview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT)];
    itemmainview.contentSize = CGSizeMake(SIZEWIDTH, 667);
    //itemmainview.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    [itemmainview setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];

#pragma mark 导航栏
    UIView *nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 64)];
    nav.backgroundColor = [UIColor blackColor];
    

    //设置导航栏左侧“返回”按钮
    UIButton *fanhui = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 64)];
    [fanhui addTarget:self action:@selector(didClickReturnButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"returnback" ofType:@"png"]];
    image = [self reSizeImage:image toSize:CGSizeMake(13.0f, 25.0f)];
    
    [fanhui setImage:image forState:UIControlStateNormal];
    [fanhui setTitle:@" 返回" forState:UIControlStateNormal];
    fanhui.titleLabel.font = [UIFont systemFontOfSize:20];
    
    fanhui.imageEdgeInsets = UIEdgeInsetsMake(26.5,-15,5,fanhui.titleLabel.bounds.size.width);
    fanhui.titleEdgeInsets = UIEdgeInsetsMake(26.5, -5, 5, 13);
    
    
    [nav addSubview:fanhui];
    //设置导航条文字
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, SIZEWIDTH-200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font            = [UIFont boldSystemFontOfSize:20];  //设置文本字体与大小
    titleLabel.textColor       = [UIColor whiteColor];  //设置文本颜色
    titleLabel.textAlignment   = NSTextAlignmentCenter;
    titleLabel.text = @"宝贝详情";
    
    [nav addSubview:titleLabel];
    
  
    
    UIButton *meButton = [[UIButton alloc]initWithFrame:CGRectMake(SIZEWIDTH-80, 5, 100, 64)];
    [meButton addTarget:self action:@selector(didClickMeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *meimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"right" ofType:@"png"]];
    meimage = [self reSizeImage:meimage toSize:CGSizeMake(22.0f, 27.0f)];
    
    [meButton setImage:meimage forState:UIControlStateNormal];
    [nav addSubview:meButton];
    [itemmainview addSubview:nav];

    
#pragma mark 定义轮播图
    NSMutableArray* pagearray = [NSMutableArray arrayWithCapacity:5];
    for (int i = 1 ; i <= 2; i++) {
        [pagearray addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"page%d",i] ofType:@"png"]];
    }
    
    LKPageView* page = [[LKPageView alloc]initWithPathStringArray:pagearray andFrame:CGRectMake(0, 64,SIZEWIDTH,SIZEHEIGHT/3 - 20)];
    
    [itemmainview addSubview:page];
    
#pragma mark 名称尺寸信息
    UIView  * tableView = [[UIView alloc] initWithFrame:CGRectMake(0, page.frame.size.height+page.frame.origin.y, SIZEWIDTH,SIZEHEIGHT/10)];
    tableView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    //tableView.backgroundColor = [UIColor blackColor];
    //定义边缘
    UIView *upEdge = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 1)];
    UIView *tabledownEdge = [[UIView alloc] initWithFrame:CGRectMake(0,tableView.frame.size.height-1, SIZEWIDTH, 1)];
    upEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    tabledownEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    int leftedge = SIZEWIDTH/20;
    //定义label
    UILabel *itemname = [[UILabel alloc] initWithFrame:CGRectMake(SIZEWIDTH/20, 1, SIZEWIDTH*3/4-1-SIZEWIDTH/20, tableView.frame.size.height/2)];
    UILabel *itemframe = [[UILabel alloc] initWithFrame:CGRectMake(SIZEWIDTH/20, itemname.frame.size.height+1, SIZEWIDTH*3/4-1-SIZEWIDTH/20, tableView.frame.size.height/2)];
    itemname.text = @"战国红招财鼠一对";
    itemframe.text = @"尺寸55mm＊45mm＊35mm";
    //定义分割线
    UIView *rightEdge = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH*4/5, tableView.frame.size.height/6, 1, tableView.frame.size.height*2/3)];
    rightEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    //定义分享按钮
    UIButton *shareButton = [[UIButton alloc]initWithFrame:CGRectMake(rightEdge.frame.origin.x+1, 0, SIZEWIDTH-rightEdge.frame.origin.x-1, tableView.frame.size.height)];
    [shareButton addTarget:self action:@selector(didClickShareButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIImage *shareimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"market_index_share" ofType:@"png"]];
    [shareButton setImage:shareimage forState:UIControlStateNormal];
    [tableView addSubview:upEdge];
    [tableView addSubview:tabledownEdge];
    [tableView addSubview:itemname];
    [tableView addSubview:itemframe];
    [tableView addSubview:rightEdge];
    [tableView addSubview:shareButton];
    [itemmainview addSubview:tableView];
#pragma mark 添加价格view
    UIView *itemprizeview = [[UIView alloc] initWithFrame:CGRectMake(0, tableView.frame.origin.y+tableView.frame.size.height, SIZEWIDTH, SIZEHEIGHT*13.3/60)];
    UIView *prizedownEdge = [[UIView alloc] initWithFrame:CGRectMake(0,itemprizeview.frame.size.height-1, SIZEWIDTH, 1)];
    prizedownEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    UILabel *itemprize = [[UILabel alloc] initWithFrame:CGRectMake(leftedge, itemprizeview.frame.size.height*2/3, SIZEWIDTH/2-leftedge, itemprizeview.frame.size.height/3)];
    itemprize.textColor = [UIColor colorWithRed:214.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0];
    itemprize.text = @"￥ 1800";
    [itemprize setFont:[UIFont systemFontOfSize:40]];
    UILabel *itemfreight = [[UILabel alloc] initWithFrame:CGRectMake(SIZEWIDTH/2+2*leftedge, itemprizeview.frame.size.height*2/3, SIZEWIDTH/2-leftedge, itemprizeview.frame.size.height/3)];
    itemfreight.text = @"运费：你猜谁承担";
    [itemfreight setFont:[UIFont systemFontOfSize:15]];
    //itemprizeview.backgroundColor = [UIColor blackColor];
    [itemprizeview addSubview:prizedownEdge];
    [itemprizeview addSubview:itemprize];
    [itemprizeview addSubview:itemfreight];
    [itemmainview addSubview:itemprizeview];
    
#pragma mark 添加宝贝描述
    UIView *itemdescriptionview = [[UIView alloc] initWithFrame:CGRectMake(0, itemprizeview.frame.origin.y + itemprizeview.frame.size.height, SIZEWIDTH, SIZEWIDTH/10)];
    //itemdescriptionview.backgroundColor = [UIColor blackColor];
    //添加边缘和描述标题
    UIView *descriptiondownEdge = [[UIView alloc] initWithFrame:CGRectMake(0,itemdescriptionview.frame.size.height-1, SIZEWIDTH, 1)];
    descriptiondownEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    UILabel *itemdestitle = [[UILabel alloc] initWithFrame:CGRectMake(leftedge, 0, SIZEWIDTH/2, SIZEWIDTH/10)];
    itemdestitle.text = @"藏品描述";
    [itemdestitle setFont:[UIFont systemFontOfSize:15]];
    //添加查看按钮
    UIButton *descriptionDetailButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH*3/4, 0, SIZEWIDTH/4, SIZEWIDTH/10)];
    descriptionDetailButton.tag = 0;
    [descriptionDetailButton addTarget:self action:@selector(didClickDetailButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //descriptionDetailButton.backgroundColor = [UIColor yellowColor];
    UIImage *detailimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"market_index_detail" ofType:@"png"]];
    [descriptionDetailButton setImage:detailimage forState:UIControlStateNormal];
    [itemdescriptionview addSubview:descriptionDetailButton];
    [itemdescriptionview addSubview:descriptiondownEdge];
    [itemdescriptionview addSubview:itemdestitle];
    [itemmainview addSubview:itemdescriptionview];
    
#pragma mark 卖家信息
    UIView *sellerView = [[UIView alloc] initWithFrame:CGRectMake(0, itemdescriptionview.frame.origin.y + itemdescriptionview.frame.size.height, SIZEWIDTH, SIZEHEIGHT - itemdescriptionview.frame.origin.y - itemdescriptionview.frame.size.height-SIZEHEIGHT/13)];
    //sellerView.backgroundColor = [UIColor redColor];
    UIButton *sellerLogoButton = [[UIButton alloc] initWithFrame:CGRectMake(leftedge, leftedge/2, 60, 60)];
    [sellerLogoButton.layer setCornerRadius:10];
    sellerLogoButton.backgroundColor = [UIColor grayColor];
    UILabel *sellerName = [[UILabel alloc] initWithFrame:CGRectMake(sellerLogoButton.frame.origin.x+sellerLogoButton.frame.size.width+leftedge, sellerLogoButton.frame.origin.y+sellerLogoButton.frame.size.height/3, SIZEWIDTH/3, 20)];
    sellerName.text = @"守龙斋战果红";
    [sellerName setFont:[UIFont systemFontOfSize:15]];
    UIView *sellerRightEdge = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH*4/5, sellerView.frame.size.height/5, 1, tableView.frame.size.height*2/3)];
    sellerRightEdge.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    //查看更多按钮
    UIButton *sellerMoreButton = [[UIButton alloc] initWithFrame:CGRectMake(sellerRightEdge.frame.origin.x, sellerRightEdge.frame.origin.y, SIZEWIDTH-sellerRightEdge.frame.origin.x, tableView.frame.size.height*2/3)];
    //sellerMoreButton.backgroundColor = [UIColor blackColor];
    UIImage *sellermoreimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"market_index_more" ofType:@"png"]];
    [sellerMoreButton setImage:sellermoreimage forState:UIControlStateNormal];
    [sellerMoreButton addTarget:self action:@selector(didClickMoreButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [sellerView addSubview:sellerName];
    [sellerView addSubview:sellerLogoButton];
    [sellerView addSubview:sellerRightEdge];
    [sellerView addSubview:sellerMoreButton];
    [itemmainview addSubview:sellerView];
    
#pragma mark 底部购买view
    UIView *itembuyview = [[UIView alloc] initWithFrame:CGRectMake(0,sellerView.frame.size.height+sellerView.frame.origin.y, SIZEWIDTH, SIZEHEIGHT-sellerView.frame.origin.y-sellerView.frame.size.height)];
    
    itembuyview.backgroundColor = [UIColor colorWithRed:77.0/255.0 green:77.0/255.0 blue:77.0/255.0 alpha:1.0];
    //客服按钮
    UIButton *customerServiceButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, itembuyview.frame.size.width/6, itembuyview.frame.size.height)];
    UIImage *customerserviceimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"market_index_service" ofType:@"png"]];
    [customerServiceButton setImage:customerserviceimage forState:UIControlStateNormal];
    [customerServiceButton addTarget:self action:@selector(didClickServiceButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIView *buyedge = [[UIView alloc] initWithFrame:CGRectMake(customerServiceButton.frame.size.width,0, 1, itembuyview.frame.size.height)];
    buyedge.backgroundColor = [UIColor whiteColor];
    //收藏按钮
    UIButton *customerCollectButton = [[UIButton alloc] initWithFrame:CGRectMake(buyedge.frame.origin.x, 0, itembuyview.frame.size.width/6, itembuyview.frame.size.height)];
    UIImage *customcollectimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"market_index_collect" ofType:@"png"]];
    [customerCollectButton setImage:customcollectimage forState:UIControlStateNormal];
    [customerCollectButton addTarget:self action:@selector(didClickCollectButtonAction) forControlEvents:UIControlEventTouchUpInside];
    //加入购物车按钮
    UIButton *customerAddBuyButton = [[UIButton alloc] initWithFrame:CGRectMake(customerCollectButton.frame.origin.x+customerCollectButton.frame.size.width, 0, SIZEWIDTH/3, itembuyview.frame.size.height)];
    [customerAddBuyButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [customerAddBuyButton addTarget:self action:@selector(didClickAddBuyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    //加入立即购买按钮
    UIButton *customerBuyButton = [[UIButton alloc] initWithFrame:CGRectMake(customerAddBuyButton.frame.origin.x+customerAddBuyButton.frame.size.width, 0, itembuyview.frame.size.width/3, itembuyview.frame.size.height)];
    [customerBuyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [customerBuyButton addTarget:self action:@selector(didClickBuyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [itembuyview addSubview:customerServiceButton];
    [itembuyview addSubview:buyedge];
    [itembuyview addSubview:customerCollectButton];
    [itembuyview addSubview:customerAddBuyButton];
    [itembuyview addSubview:customerBuyButton];
    [itemmainview addSubview:itembuyview];
    
#pragma mark add mainview
    [self.view addSubview:itemmainview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//重新设置UIImage的长宽
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}
- (void)didClickReturnButtonAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didClickMeButtonAction {
    NSLog(@"tiao");
}
- (void)didClickShareButtonAction{
    NSLog(@"click share");
}
- (void)didClickDetailButtonAction:(UIButton *)btn {
    
    btn.tag++;
    if(btn.tag % 2 == 0){
        //[self changeViewSize];
        //btn.superview.hidden = YES;
    }
    else{
        [self returnViewSize];
    }

}
    
- (void)didClickMoreButtonAction{
    NSLog(@"more");
}
-(void)didClickAddBuyButtonAction{
    NSLog(@"addbuy");
}
- (void)didClickBuyButtonAction{
    BuyMainViewController *buyMainViewController = [[BuyMainViewController alloc] init];
    [buyMainViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:buyMainViewController animated:YES completion:nil];
    
}
- (void)didClickServiceButtonAction{
    
    ServiceTalkTableViewController *servicetalk = [[ServiceTalkTableViewController alloc] init];
    [servicetalk setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:servicetalk animated:YES completion:nil];
}
- (void)didClickCollectButtonAction{
    NSLog(@"collect");
}
- (void)changeViewSize{
    
        
}
- (void)returnViewSize{
     NSLog(@"returnsize");
}
    
@end
