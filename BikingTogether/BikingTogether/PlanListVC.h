//
//  PlanListVC.h
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ViewController.h"

#import "NewEventVC.h"
#import "Event.h"
#import "EventVC.h"


@interface PlanListVC : ViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
