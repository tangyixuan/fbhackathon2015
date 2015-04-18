//
//  RidingMapVC.h
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ViewController.h"
#import "StatisticVC.h"

#import "GlobalResources.h"
#import "ObjectMap.h"

@interface RidingMapVC : ViewController <SingletonGPSProtocol> {
    ObjectMap *objectMap;
    int screenWidth;
    int screenHeight;
    
    
    UILabel *labelAngle;
    UILabel *labelSpeed;

    NSTimer *timer;
    NSRunLoop *runLoop;
}

@end
