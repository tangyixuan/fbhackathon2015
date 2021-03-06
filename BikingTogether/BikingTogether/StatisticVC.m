//
//  StatisticVC.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "StatisticVC.h"
#import "GlobalResources.h"

@interface StatisticVC ()
-(void)doneTapped;

@end

@implementation StatisticVC

- (void) setup {
    [self setupVariables];
    [self setupUI];
    
}

- (void) setupVariables {
    NSLog(@"[StatisticVC: setupVariables]");
    screenWidth = [GlobalResources getScreenWidth];
    screenHeight = [GlobalResources getScreenHeight];
}

- (void) setupUI {
    NSLog(@"[StatisticVC: setupUI]");
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *tempLabel;
    CGSize tempSize;
    
    tempSize = CGSizeMake(screenWidth*25/100, 20);
    tempLabel = [[UILabel alloc] init];
    [tempLabel setText:@"Distance"];
    [tempLabel setFont:[UIFont italicSystemFontOfSize:14]];
    [tempLabel setTextAlignment:NSTextAlignmentCenter];
    [tempLabel setFrame:CGRectMake((screenWidth-tempSize.width)*8/100, screenHeight * 7.75/ 10, tempSize.width, tempSize.height)];
    [self.view addSubview:tempLabel];
    
    
    tempSize = CGSizeMake(screenWidth*25/100, 40);
    labelTotalDistance = [[UILabel alloc] init];
    [labelTotalDistance setText:@"-"];
    [labelTotalDistance setTextAlignment:NSTextAlignmentCenter];
    [labelTotalDistance setFont:[UIFont boldSystemFontOfSize:30]];
    [labelTotalDistance setFrame:CGRectMake((screenWidth-tempSize.width)*8/100, screenHeight * 8.05 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:labelTotalDistance];
    
    tempSize = CGSizeMake(screenWidth*25/100, 20);
    tempLabel = [[UILabel alloc] init];
    [tempLabel setText:@"Total Time"];
    [tempLabel setFont:[UIFont italicSystemFontOfSize:14]];
    [tempLabel setTextAlignment:NSTextAlignmentCenter];
    [tempLabel setFrame:CGRectMake((screenWidth-tempSize.width)*50/100, screenHeight * 7.75 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:tempLabel];
    
    
    tempSize = CGSizeMake(screenWidth*25/100, 40);
    labelTotalTime = [[UILabel alloc] init];
    [labelTotalTime setText:@"-"];
    [labelTotalTime setTextAlignment:NSTextAlignmentCenter];
    [labelTotalTime setFont:[UIFont boldSystemFontOfSize:30]];
    [labelTotalTime setFrame:CGRectMake((screenWidth-tempSize.width)*50/100, screenHeight * 8.05 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:labelTotalTime];
    
    tempSize = CGSizeMake(screenWidth*25/100, 20);
    tempLabel = [[UILabel alloc] init];
    [tempLabel setText:@"Av. Incline"];
    [tempLabel setFont:[UIFont italicSystemFontOfSize:14]];
    [tempLabel setTextAlignment:NSTextAlignmentCenter];
    [tempLabel setFrame:CGRectMake((screenWidth-tempSize.width)*92/100, screenHeight * 7.75 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:tempLabel];
    
    
    tempSize = CGSizeMake(screenWidth*25/100, 40);
    labelAverageIncline = [[UILabel alloc] init];
    [labelAverageIncline setText:@"-"];
    [labelAverageIncline setTextAlignment:NSTextAlignmentCenter];
    [labelAverageIncline setFont:[UIFont boldSystemFontOfSize:30]];
    [labelAverageIncline setFrame:CGRectMake((screenWidth-tempSize.width)*92/100, screenHeight * 8.05 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:labelAverageIncline];

    

    

}

- (void) setObjectMap:(ObjectMap *)anObjectMap {
    objectMap = anObjectMap;
    [anObjectMap displayRoute];
    [self.view addSubview:[objectMap getMapView]];
    
    [labelTotalDistance setText:[NSString stringWithFormat:@"%.2f", [objectMap getTotalDistance]]];
    [labelTotalTime setText:[NSString stringWithFormat:@"%.2f", [objectMap getTotalTime]]];
    [labelAverageIncline setText:[NSString stringWithFormat:@"%.1f", [objectMap getAverageIncline]]];
    
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      [self.navigationItem setHidesBackButton:YES];
     [self.navigationItem setTitle:@"Statistics"];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"done" style:UIBarButtonItemStylePlain target:self action:@selector(doneTapped)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    [self setup];
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
