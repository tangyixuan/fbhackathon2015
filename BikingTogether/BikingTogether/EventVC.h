//
//  EventVC.h
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ViewController.h"
#import "RidingMapVC.h"
#import "FriendForEventVC.h"
#import "Event.h"
#import "UserInfor.h"
@interface EventVC : ViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) Event *event;


@end
