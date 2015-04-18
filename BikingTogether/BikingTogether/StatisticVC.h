//
//  StatisticVC.h
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ViewController.h"
#import "ObjectMap.h"

@interface StatisticVC : ViewController {
    int screenWidth;
    int screenHeight;
    ObjectMap *objectMap;
    
    UILabel *labelTotalDistance;
    UILabel *labelTotalTime;
    UILabel *labelAverageIncline;
}

- (void) setObjectMap:(ObjectMap*)anObjectMap;

@end
