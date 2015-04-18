//
//  SingletonGPS.m
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "SingletonGPS.h"

@implementation SingletonGPS


- (void) setup {
    NSLog(@"[SingletonGPS: setup]");
    [self setupGPS];
}

- (void) setupGPS {
    NSLog(@"[ViewController: setupGPS]");
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    //    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 0;
    
    
    
    // ===============[ This bastard hides in the Info.plist ]===============
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        NSLog(@"[ViewController: setupGPS] responds to selector");
        [locationManager requestWhenInUseAuthorization];
    }
}




#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"[SingletonGPS: didUpdateToLocation] %@", newLocation);
    
    currentLocation = newLocation;
    
    if ([self.delegate respondsToSelector:@selector(gpsLocationManager:didUpdateToLocation:fromLocation:)]) {
        [self.delegate gpsLocationManager:manager didUpdateToLocation:newLocation fromLocation:oldLocation];
    } else {
        NSLog(@"Failed to respond to delegate");
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Failed with error");
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}



- (double) getLatitude {
    return currentLocation.coordinate.latitude;
}


- (double) getLongitude {
    return currentLocation.coordinate.longitude;
}

- (void) startUpdatingLocation {
    NSLog(@"[SingletonGPS: startUpdatingLocation]");
    [locationManager startUpdatingLocation];
}

- (void) stopUpdatingLocation {
    NSLog(@"[SingletonGPS: stopUpdatingLocation]");
    [locationManager stopUpdatingLocation];
}

+ (id) sharedInstance {
    static SingletonGPS *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
            [sharedInstance setup];
        }
    }
    return sharedInstance;
}




@end
