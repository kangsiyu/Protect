//
//  ServiceTalkTableViewController.h
//  AntiquepPie
//
//  Created by ksy on 15/5/18.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceTalkTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSArray *dataList;
@property (nonatomic,retain) UITableView *myTableView;

@end
