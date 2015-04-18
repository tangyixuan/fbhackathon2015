//
//  ObjectMap.h
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "ObjectMapRouteView.h"
#import "CSMapAnnotation.h"
#import "CSImageAnnotationView.h"


@interface ObjectMap : NSObject <MKMapViewDelegate> {
    MKMapView *mapView;
    NSMutableArray *arrayUsers;
    ObjectMapRouteView *mapRouteView;
    NSMutableArray *arrayAllData;
    
    int currentState;
    float currentSpeed;
    CSMapAnnotation* annotationUser;
    
    
    
}

- (void) setup:(CGRect) aRect;
- (MKMapView *) getMapView;
- (void) displayRoute;
//- (void) displayRoute:(NSMutableArray *) arrayOfData;
- (void) addGpsCoordinateWithLongitude:(double)aLongitude latitude:(double)aLatitude accelX:(double)anAccelX accelY:(double)anAccelY;
- (double) getCurrentSpeed;

- (double) getTotalDistance;
- (double) getTotalTime;
//- (double) getAverageSpeed;
- (double) getAverageIncline;


//- (void)



@end
