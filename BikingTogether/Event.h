//
//  Event.h
//  BikingTogether
//
//  Created by tangyixuan on 19/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfor.h"

@interface Event : NSObject

@property (nonatomic) NSString *eventID;
@property (nonatomic) NSString *des;
@property (nonatomic) NSString *meetingPlace;
@property (nonatomic) NSString *date;
@property (nonatomic) NSMutableArray *participants;

-(id)initWithEventID:(NSString *)eventID;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
