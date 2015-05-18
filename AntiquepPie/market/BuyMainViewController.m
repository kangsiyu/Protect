//
//  BuyMainViewController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/15.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "BuyMainViewController.h"
#import "MarketController.h"
#import "marketItemDetailViewController.h"
#import "UIbarbutton_init.h"
#import "MyConfig.h"
#import "MainTabView.h"
#import "ChoosePayViewController.h"

@interface BuyMainViewController ()


@end

@implementation BuyMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT)];
    mainView.contentSize = CGSizeMake(SIZEWIDTH, 667);
    //设置背景
    [self.view setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]];
#pragma mark 设置导航条
    UIView *nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 64)];
    nav.backgroundColor = [UIColor blackColor];
    
    //设置导航条文字
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, SIZEWIDTH-200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font            = [UIFont  systemFontOfSize:25];  //设置文本字体与大小
    titleLabel.textColor       = [UIColor whiteColor];  //设置文本颜色
    titleLabel.textAlignment   = NSTextAlignmentCenter;
    titleLabel.text = @"提交订单";
    
    [nav addSubview:titleLabel];
    
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
    [mainView addSubview:nav];

#pragma mark 添加默认地址列表
    int Edge = SIZEWIDTH/15;
    UIButton *addressHaveCheckButton = [[UIButton alloc] initWithFrame:CGRectMake(Edge, nav.frame.size.height+Edge, 20, 20)];
    UIImage *addressimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"market_address_icon" ofType:@"png"]];
    UIImage *addressselectedimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"market_address_icon_selected" ofType:@"png"]];
    addressHaveCheckButton.tag = 1;

    [addressHaveCheckButton setImage:addressimage forState:UIControlStateNormal];
    [addressHaveCheckButton setImage:addressselectedimage forState:UIControlStateSelected];
    [addressHaveCheckButton addTarget:self action:@selector(didClickAddressButtonAction:) forControlEvents:UIControlEventTouchDown];
    //默认选中第一个
    addressHaveCheckButton.selected = YES;
    //添加用户信息
    UILabel *buyerInformationLabel = [[UILabel alloc] initWithFrame:CGRectMake(addressHaveCheckButton.frame.origin.x + addressHaveCheckButton.frame.size.width + Edge, addressHaveCheckButton.frame.origin.y, SIZEWIDTH*4/5, 20)];
    buyerInformationLabel.text = @"关东升    16395979421";
    UILabel *buyerAddressInformationLabel = [[UILabel alloc] initWithFrame:CGRectMake(buyerInformationLabel.frame.origin.x, buyerInformationLabel.frame.origin.y + buyerInformationLabel.frame.size.height + Edge/5, SIZEWIDTH*4/5, 20)];
    buyerAddressInformationLabel.text = @"中国北京海淀广源大厦";
    UIView *firstEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0, buyerAddressInformationLabel.frame.origin.y+buyerAddressInformationLabel.frame.size.height + Edge, SIZEWIDTH, 1)];
    firstEdgeView.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];

#pragma mark 添加可选地址信息
    UIButton *addressNoCheckButton = [[UIButton alloc] initWithFrame:CGRectMake(addressHaveCheckButton.frame.origin.x, firstEdgeView.frame.origin.y+Edge/2+0.25*Edge, 20, 20)];
    [addressNoCheckButton setBackgroundImage:addressimage forState:UIControlStateNormal];
    [addressNoCheckButton setBackgroundImage:addressselectedimage forState:UIControlStateSelected];
    [addressNoCheckButton addTarget:self action:@selector(didClickAddressButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    addressNoCheckButton.tag = 2;
    
    [mainView addSubview:addressHaveCheckButton];
    [mainView addSubview:buyerInformationLabel];
    [mainView addSubview:buyerAddressInformationLabel];
    [mainView addSubview:firstEdgeView];
    [mainView addSubview:addressNoCheckButton];
 //添加label
    for (int i = 0; i < 6; i++) {
        UILabel *buyerLabels = [[UILabel alloc] initWithFrame:CGRectMake(buyerAddressInformationLabel.frame.origin.x, addressNoCheckButton.frame.origin.y + i * (buyerInformationLabel.frame.size.height + Edge), buyerInformationLabel.frame.size.width/4, buyerInformationLabel.frame.size.height)];
        switch (i) {
            case 0:
                buyerLabels.text = @"收货人:";
                break;
            case 1:
                buyerLabels.text = @"手机号:";
                break;
            case 2:
                buyerLabels.text = @"省/市:";
                break;
            case 3:
                buyerLabels.text = @"城市:";
                break;
            case 4:
                buyerLabels.text = @"区县:";
                break;
            case 5:
                buyerLabels.text = @"其他:";
                break;
            default:
                break;
        }
        [mainView addSubview:buyerLabels];
    }
//添加textfield
    for (int i = 0; i < 6; i++) {
        UITextField *buyerNameAndPhone = [[UITextField alloc] initWithFrame:CGRectMake(buyerInformationLabel.frame.origin.x + buyerInformationLabel.frame.size.width/4, addressNoCheckButton.frame.origin.y + i*(buyerInformationLabel.frame.size.height + Edge)-0.25*Edge, buyerInformationLabel.frame.size.width*3/4-Edge, buyerInformationLabel.frame.size.height*1.5)];
        buyerNameAndPhone.tag = i + 1;
        buyerNameAndPhone.layer.borderWidth = 1;
        buyerNameAndPhone.layer.borderColor=[[UIColor blackColor] CGColor];
        buyerNameAndPhone.backgroundColor = [UIColor whiteColor];
        switch (i) {
            case 0:
                buyerNameAndPhone.placeholder = @"请输入收货人姓名";
                break;
            case 1:
                buyerNameAndPhone.placeholder = @"请输入收货人手机号";
                break;
            case 2:
                buyerNameAndPhone.placeholder = @"请选择省份";
                break;
            case 3:
                buyerNameAndPhone.placeholder = @"请选择城市";
                break;
            case 4:
                buyerNameAndPhone.placeholder = @"请选择区县";
                break;
            case 5:
                buyerNameAndPhone.placeholder = @"请输入";
                break;
            default:
                break;
        }
        [mainView addSubview:buyerNameAndPhone];
}
//添加三个可选pickerview
/*for (int i = 2; i < 5; i++) {
        UIPickerView *buyerPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(buyerInformationLabel.frame.origin.x + buyerInformationLabel.frame.size.width/4, addressNoCheckButton.frame.origin.y + i*(buyerInformationLabel.frame.size.height + Edge)-0.25*Edge, buyerInformationLabel.frame.size.width*3/4-Edge, buyerInformationLabel.frame.size.height*1.5)];
        buyerPicker.tag = i;
        //buyerPicker.delegate = self;
        //buyerPicker.dataSource = self;
        buyerPicker.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        buyerPicker.showsSelectionIndicator = YES;
        
        [self.view addSubview:buyerPicker];
    }
    
*/
//第二边缘
    UIView *secondEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0, addressNoCheckButton.frame.origin.y + 6*(buyerInformationLabel.frame.size.height + Edge), SIZEWIDTH, 1)];
    secondEdgeView.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];

    [mainView addSubview:secondEdgeView];
    
//logo和交易额
    UIImageView *buyerLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(Edge, secondEdgeView.frame.origin.y+Edge/2, 80, 80)];
    //NSLog(@"@%  @%",SIZEWIDTH,SIZEHEIGHT);
    buyerLogoView.backgroundColor = [UIColor grayColor];
    buyerLogoView.layer.cornerRadius = 10;
    
    [mainView addSubview:buyerLogoView];
    for (int i = 0; i < 2; i++) {
        UILabel *buyerLabels = [[UILabel alloc] initWithFrame:CGRectMake(buyerInformationLabel.frame.origin.x + buyerInformationLabel.frame.size.width/4, buyerLogoView.frame.origin.y + i*(2*Edge)+0.2*Edge, SIZEWIDTH/2, 20)];
        switch (i) {
            case 0:
                buyerLabels.text = @"交易金额:100000";
                break;
            case 1:
                buyerLabels.text = @"运费: 15";
                break;
            default:
                break;
        }
        [mainView addSubview:buyerLabels];
    }
//边缘线
    UIView *thirdEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0, buyerLogoView.frame.origin.y+Edge/2+buyerLogoView.frame.size.height, SIZEWIDTH, 1)];
    thirdEdgeView.backgroundColor = [UIColor colorWithRed:186.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1.0];
    [mainView addSubview:thirdEdgeView];
//订单总额
    UILabel *buyerTotalMoneyName = [[UILabel alloc] initWithFrame:CGRectMake(Edge, thirdEdgeView.frame.origin.y+Edge/3, SIZEWIDTH/3, 30)];
    buyerTotalMoneyName.text = @"订单总额";
    [mainView addSubview:buyerTotalMoneyName];
    
    UILabel *buyerTotalMoneyNum = [[UILabel alloc] initWithFrame:CGRectMake(SIZEWIDTH-buyerTotalMoneyName.frame.size.width/2-Edge, buyerTotalMoneyName.frame.origin.y, SIZEWIDTH/5, 30)];
    buyerTotalMoneyNum.text = @"100015";
    [mainView addSubview:buyerTotalMoneyNum];
//提交按钮
    UIButton *buyerCommitButton = [[UIButton alloc] initWithFrame:CGRectMake(Edge, buyerTotalMoneyName.frame.origin.y+buyerTotalMoneyName.frame.size.height+Edge/2, SIZEWIDTH - 2*Edge, 50)];
    [buyerCommitButton setBackgroundColor:[UIColor colorWithRed:241.0/255.0 green:171.0/255.0 blue:71.0/255.0 alpha:1.0]];
    [buyerCommitButton setTitle:@"提交订单" forState:UIControlStateNormal];
    [buyerCommitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mainView addSubview:buyerCommitButton];
    [buyerCommitButton addTarget:self action:@selector(didClickCommitButtonAction) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:mainView];
    

}



- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}

- (void)didClickReturnButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didClickAddressButtonAction:(UIButton *) sender{
    for (UIButton *button in sender.superview.subviews) {
        if (button.tag == 1) {
            if (button.tag != sender.tag) {
                button.selected = NO;
                sender.selected = YES;
            }
        }
        else if (button.tag == 2){
            if (button.tag != sender.tag){
                button.selected = NO;
                sender.selected = YES;
            }
        }
    }
    
}
- (void)didClickCommitButtonAction{
    ChoosePayViewController *choosePayViewController = [[ChoosePayViewController alloc] init];
    [choosePayViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:choosePayViewController animated:YES completion:nil];
}
@end
