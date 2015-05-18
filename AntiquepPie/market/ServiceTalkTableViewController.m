//
//  ServiceTalkTableViewController.m
//  AntiquepPie
//
//  Created by ksy on 15/5/18.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ServiceTalkTableViewController.h"

@interface ServiceTalkTableViewController ()

@end

@implementation ServiceTalkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


        
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
        titleLabel.text = @"守龙斋";
        
        [nav addSubview:titleLabel];
        
        
        
        UIButton *meButton = [[UIButton alloc]initWithFrame:CGRectMake(SIZEWIDTH-80, 5, 100, 64)];
        [meButton addTarget:self action:@selector(didClickMeButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *meimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"right" ofType:@"png"]];
        meimage = [self reSizeImage:meimage toSize:CGSizeMake(22.0f, 27.0f)];
        
        [meButton setImage:meimage forState:UIControlStateNormal];
        [nav addSubview:meButton];
        [self.view addSubview:nav];
#pragma mark 测试test
    
    // 初始化tableView的数据
    NSArray *list = [NSArray arrayWithObjects:@"武汉",@"上海",@"北京",@"深圳",@"广州",@"重庆",@"香港",@"台海",@"天津", nil];
    self.dataList = list;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, nav.frame.size.height, SIZEWIDTH, SIZEHEIGHT) style:UITableViewStylePlain];
    // 设置tableView的数据源
    tableView.dataSource = self;
    // 设置tableView的委托
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    tableView.separatorStyle = NO;
    
    
    
    // 设置tableView的背景图
    self.myTableView = tableView;
    [self.view addSubview:_myTableView];
#pragma mark 聊天主窗口
        //UITableView *mainTalkView = [[UITableView alloc] initWithFrame:CGRectMake(0, nav.frame.size.height, SIZEWIDTH, SIZEHEIGHT) style:UITableViewStylePlain];
        
        
        
    }
    


    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 6;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (void)didClickMeButtonAction{
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.dataList objectAtIndex:row];
    cell.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    //UIImageView *userPictureView = [[UIImageView alloc] initWithImage:];
    cell.imageView.image = [UIImage imageNamed:@"market_index_talk.png"];
    
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
