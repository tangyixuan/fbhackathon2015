//
//  Event.m
//  BikingTogether
//
//  Created by tangyixuan on 19/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "Event.h"

@implementation Event


-(id)initWithEventID:(NSString *)eventID{
    if (!self){
        self = [super init];
    }
    //will get all the information form server in later versions
    
    
    if([eventID isEqualToString:@"1darling"]){
        self.eventID = eventID;
        self.des = @"City Center Biking";
        self.meetingPlace = @"Darling Harbour";
        self.date = @"May 1st, 2015";
        self.participants = [[NSMutableArray alloc]init];
    }else if([eventID isEqualToString:@"2UNSW"]){
        self.eventID = eventID;
        self.des = @"Campus Biking";
        self.meetingPlace = @"High Street Gate 4";
        self.date = @"May 2nd, 2015";
        self.participants = [[NSMutableArray alloc]init];
    }
    
    NSArray *names = [[NSArray alloc]initWithObjects:@"Lizzy",@"James",@"Doris",@"Esther",nil];
    NSArray *imageNames = [[NSArray alloc]initWithObjects:@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",nil];
    
    for (int i=0;i<[names count];i++){
        NSString *name = [names objectAtIndex:(NSInteger)i];
        UIImage *image = [UIImage imageNamed:[imageNames objectAtIndex:(NSInteger)i]];
        UserInfor *user = [[UserInfor alloc]initWithNmae:name andImage:image];
        NSLog(@"NAME: %@, PHOTO:%@",user.name,user.image);
        [self.participants addObject:user];
    }
    
    return self;
}


@end
