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


// =====================================[ Setup ]=====================================
#pragma mark - Setup

- (void) setup {
    NSLog(@"[RidingMapVC: setup]");
    
//    [SingletonGPS sharedInstance];
    
    [self setupVariables];
    [self setupUI];
    [self setupGPS];
    [self setupMap];
    [self setupAccel];
    
//    [self setupTestTimer];
}

- (void) setupVariables {
    NSLog(@"[RidingMapVC: setupVariables]");
    screenWidth = [GlobalResources getScreenWidth];
    screenHeight = [GlobalResources getScreenHeight];
}

- (void) setupUI {
    NSLog(@"[RidingMapVC: setupUI]");
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *tempLabel;
    CGSize tempSize;
    
    tempSize = CGSizeMake(screenWidth*3/10, 20);
    tempLabel = [[UILabel alloc] init];
    [tempLabel setText:@"Angle"];
    [tempLabel setTextAlignment:NSTextAlignmentCenter];
    [tempLabel setFont:[UIFont italicSystemFontOfSize:14]];
    [tempLabel setFrame:CGRectMake((screenWidth-tempSize.width)/4, screenHeight * 7.75/ 10, tempSize.width, tempSize.height)];
    [self.view addSubview:tempLabel];

    
    tempSize = CGSizeMake(screenWidth*3/10, 40);
    labelAngle = [[UILabel alloc] init];
    [labelAngle setText:@"-"];
    [labelAngle setTextAlignment:NSTextAlignmentCenter];
    [labelAngle setFont:[UIFont boldSystemFontOfSize:34]];
    [labelAngle setFrame:CGRectMake((screenWidth-tempSize.width)/4, screenHeight * 8.05 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:labelAngle];
    
    tempSize = CGSizeMake(screenWidth*3/10, 20);
    tempLabel = [[UILabel alloc] init];
    [tempLabel setText:@"Speed"];
    [tempLabel setTextAlignment:NSTextAlignmentCenter];
    [tempLabel setFont:[UIFont italicSystemFontOfSize:14]];
    [tempLabel setFrame:CGRectMake((screenWidth-tempSize.width)*3/4, screenHeight * 7.75 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:tempLabel];
    
    
    tempSize = CGSizeMake(screenWidth*3/10, 40);
    labelSpeed = [[UILabel alloc] init];
    [labelSpeed setText:@"-"];
    [labelSpeed setTextAlignment:NSTextAlignmentCenter];
    [labelSpeed setFont:[UIFont boldSystemFontOfSize:34]];
    [labelSpeed setFrame:CGRectMake((screenWidth-tempSize.width)*3/4, screenHeight * 8.05 / 10, tempSize.width, tempSize.height)];
    [self.view addSubview:labelSpeed];
    
}

- (void) setupGPS {
    NSLog(@"[RidingMapVC: setupGPS]");
    
    [[SingletonGPS sharedInstance] setDelegate:self];
    [[SingletonGPS sharedInstance] startUpdatingLocation];


}

- (void) setupMap {
    NSLog(@"[RidingMapVC: setupMap]");
    
    CGSize tempSize = CGSizeMake(screenWidth*9/10, screenHeight*6/10);
    objectMap = [[ObjectMap alloc] init];
    [objectMap setup:CGRectMake((screenWidth - tempSize.width)/2, screenHeight*12/100, tempSize.width, tempSize.height)];
    [self.view addSubview:[objectMap getMapView]];
    
    [objectMap addGpsCoordinateWithLongitude:[[SingletonGPS sharedInstance]getLongitude] latitude:[[SingletonGPS sharedInstance]getLatitude] accelX:-1 accelY:-1];
    
    NSLog(@"[RidingMapVC: setupTestMap] GPS: %.6f,%.6f", [[SingletonGPS sharedInstance]getLongitude], [[SingletonGPS sharedInstance]getLatitude]);
//    [objectMap displayRoute:[GlobalResources getArraysFromGpsCsvFile:@"walk_5"]];
    
}


- (void) setupAccel {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/10
                                                            target:self
                                                          selector:@selector(updateUiAccel)
                                                          userInfo:nil
                                                           repeats:YES];
    runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode: NSDefaultRunLoopMode];
}





- (void) gpsLocationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"[RidingMapVC: didUpdateToLocation]");
    
    if (newLocation != nil) {
        NSLog(@"\nLong: %.8f\nLat : %.8f",newLocation.coordinate.longitude, newLocation.coordinate.latitude);
        [objectMap addGpsCoordinateWithLongitude:newLocation.coordinate.longitude latitude:newLocation.coordinate.latitude accelX:[[SingletonAccelerator sharedInstance]getDegX]  accelY:[[SingletonAccelerator sharedInstance]getDegY]];
        [self updateUiGps];
    }
}


// =====================================[ Update ]=====================================
#pragma mark - Update

- (void) updateUiGps {
    NSLog(@"[RidingMapVC: updateUI]");
    
    
    [labelSpeed setText:[NSString stringWithFormat:@"%.1f", [objectMap getCurrentSpeed]]];


}

- (void) updateUiAccel {
    [labelAngle setText:[NSString stringWithFormat:@"%.1f", [[SingletonAccelerator sharedInstance] getDegY]]];

}

// =====================================[ Life Cycle ]=====================================
#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   [self.navigationItem setHidesBackButton:YES];
    [self.navigationItem setTitle:@"Map"];
    
    UIBarButtonItem *endButton = [[UIBarButtonItem alloc]initWithTitle:@"end" style:UIBarButtonItemStylePlain target:self action:@selector(endTapped)];
    self.navigationItem.rightBarButtonItem = endButton;
    
    [self setup];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)endTapped{
    StatisticVC *statisticVC = [[StatisticVC alloc]init];
    [self.navigationController pushViewController:statisticVC animated:YES];
    [timer invalidate];
    [[SingletonGPS sharedInstance] setDelegate:nil];

    [statisticVC setObjectMap:objectMap];
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
