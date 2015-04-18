//
//  SingletonGPS.h
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

/*
 
 To use, use <SingletonGPSProtocol>
 Implement gpsLocationManager method
 
 */

@protocol SingletonGPSProtocol;

@interface SingletonGPS : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    
    CLLocation *currentLocation;
}

- (double) getLatitude;
- (double) getLongitude;

- (void) startUpdatingLocation;
- (void) stopUpdatingLocation;

+ (id) sharedInstance;

@property (assign) id <SingletonGPSProtocol> delegate;

@end

// Jump To Answer protocol
@protocol SingletonGPSProtocol <NSObject>
@required
- (void) gpsLocationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;




@end
