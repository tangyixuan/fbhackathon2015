//
//  FriendListVC.h
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ViewController.h"
#import "UserInfor.h"

@interface FriendListVC : ViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) NSMutableArray *friendList;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
