//
//  EventVC.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "EventVC.h"

@interface EventVC ()

-(void)startTapped;

@end

@implementation EventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Event"];

    UIBarButtonItem *startButton = [[UIBarButtonItem alloc]initWithTitle:@"start" style:UIBarButtonItemStylePlain target:self action:@selector(startTapped)];
    self.navigationItem.rightBarButtonItem = startButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithEvent{
    return nil;
    
}

-(void)startTapped{
    RidingMapVC *ridingMapVC = [[RidingMapVC alloc]init];
    [self.navigationController pushViewController:ridingMapVC animated:YES];
}

-(void)addFriendTapped{
    FriendForEventVC *friendForEventVC = [[FriendForEventVC alloc]init];
    [self.navigationController pushViewController:friendForEventVC animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
