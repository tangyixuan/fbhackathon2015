//
//  RidingMapVC.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "RidingMapVC.h"

@interface RidingMapVC ()
-(void)endTapped;
@end

@implementation RidingMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Map"];
    
    UIBarButtonItem *endButton = [[UIBarButtonItem alloc]initWithTitle:@"end" style:UIBarButtonItemStylePlain target:self action:@selector(endTapped)];
    self.navigationItem.rightBarButtonItem = endButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)endTapped{
    StatisticVC *statisticVC = [[StatisticVC alloc]init];
    [self.navigationController pushViewController:statisticVC animated:YES];
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
