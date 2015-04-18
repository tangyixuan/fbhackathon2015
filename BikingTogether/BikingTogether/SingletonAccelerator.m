//
//  SingletonAccelerator.m
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "SingletonAccelerator.h"
#define BELT_LEVELLER_DIVISOR 20.0
#define BELT_LEVELLER_ACCELEROMETER_UPDATE_INTERVAL 1.0/BELT_LEVELLER_DIVISOR
#define BELT_LEVELLER_ANIMATION_UPDATE_INTERVAL 1.0/(BELT_LEVELLER_DIVISOR)
#define BELT_LEVELLER_ANIMATION_DURATION 1.0/(BELT_LEVELLER_DIVISOR)              // slower so should should use latest update value (locked if not)


@implementation SingletonAccelerator

- (void) setup {
    NSLog(@"[SingletonAccelerator: setup]");
    
    [self setupAccelerometer];
    [self setupSamplingArrays];
    [self setupLoops];
    
}

- (void) setupAccelerometer {
    NSLog(@"[SingletonAccelerator: setupAccelerometer]");
    xAccel = 0;
    yAccel = 0;
    motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = BELT_LEVELLER_ACCELEROMETER_UPDATE_INTERVAL;
}

- (void) setupSamplingArrays {
    //    NSLog(@"[AppSpriteLeveller: setupSamplingArrays]");
    
    if (!xAccelArray || !yAccelArray) {
        int index;
        samplingSize = 10;
        xAccel = 0;
        yAccel = 0;
        
        xAccelArray = (double*) malloc(samplingSize*sizeof(double));
        if (xAccelArray == NULL) {
            NSLog(@"Could not create sampling array: X");
        }
        
        yAccelArray = (double*) malloc(samplingSize*sizeof(double));
        if (yAccelArray == NULL) {
            NSLog(@"Could not create sampling array: X");
        }
        
        for (index = 0; index < samplingSize; index++) {
            xAccelArray[index] = 0;
            yAccelArray[index] = 0;
        }
        
        latestAccelIndex = 0;
    }
}


- (void) setupLoops {
    //    NSLog(@"[SingletonAccelerator: setupSamplingArrays]");
    updateTargetAnimationTimer = [NSTimer scheduledTimerWithTimeInterval:BELT_LEVELLER_ANIMATION_UPDATE_INTERVAL
                                                                  target:self
                                                                selector:@selector(updateTarget)
                                                                userInfo:nil
                                                                 repeats:YES];
    NSRunLoop *updateTargetRunner = [NSRunLoop currentRunLoop];
    [updateTargetRunner addTimer:updateTargetAnimationTimer forMode: NSDefaultRunLoopMode];
    
    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^ (CMAccelerometerData *accelData, NSError *error) {
        //        NSLog(@"Update Accel");
        double tempXAccel = accelData.acceleration.x;
        double tempYAccel = accelData.acceleration.y;
        
        int newAccelIndex = (latestAccelIndex + 1 ) % samplingSize;
        
        xAccelArray[newAccelIndex] = tempXAccel;
        yAccelArray[newAccelIndex] = tempYAccel;
        
        tempXAccel = 0;
        tempYAccel = 0;
        
        int index;
        for (index = newAccelIndex; index < newAccelIndex + samplingSize; index++) {
            tempXAccel = tempXAccel + xAccelArray[index % samplingSize];
            tempYAccel = tempYAccel + yAccelArray[index % samplingSize];
        }
        
        xAccel = tempXAccel/10;     // average out values
        yAccel = tempYAccel/10;
        
        latestAccelIndex = (latestAccelIndex + 1)%samplingSize;
    }];
}



// ==============================[ App Functionality ]==============================

- (void) updateTarget {
    //    NSLog(@"[SingletonAccelerator: updateTarget]");
    // prevent NAN
    if (xAccel > 1) {
        xAccel = 1;
    } else if (xAccel < -1) {
        xAccel = -1;
    }
    if (yAccel > 1) {
        yAccel = 1;
    } else if (yAccel < -1) {
        yAccel = -1;
    }
    
    xDeg = asin(xAccel) * 180.0 / M_PI;
    yDeg = asin(yAccel) * 180.0 / M_PI * -1;
    
    
    
}


- (double) getDegX {
    return xDeg;
}

- (double) getDegY {
    return yDeg;
}




+ (id) sharedInstance {
    static SingletonAccelerator *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
            [sharedInstance setup];
        }
    }
    return sharedInstance;
}

@end
