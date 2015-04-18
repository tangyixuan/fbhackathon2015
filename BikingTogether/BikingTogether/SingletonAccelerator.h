//
//  SingletonAccelerator.h
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface SingletonAccelerator : NSObject {
    // Accelerometer
    
    NSTimer *updateTargetAnimationTimer;
    
    int targetSize;
    
    double xAccel;
    double yAccel;
    double xDeg;
    double yDeg;
    BOOL finishAnimation;
    
    double* xAccelArray;
    double* yAccelArray;
    
    int latestAccelIndex;
    int samplingSize;
    
    CMMotionManager *motionManager;
}

+ (id) sharedInstance;
- (double) getDegX;
- (double) getDegY;

@end
