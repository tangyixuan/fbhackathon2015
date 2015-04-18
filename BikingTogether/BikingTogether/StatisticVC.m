//
//  StatisticVC.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "StatisticVC.h"

@interface StatisticVC ()
-(void)doneTapped;

@end

@implementation StatisticVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.navigationItem setTitle:@"Statistics"];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"done" style:UIBarButtonItemStylePlain target:self action:@selector(doneTapped)];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doneTapped{
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
