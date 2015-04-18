//
//  ObjectMap.m
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ObjectMap.h"
#import "GlobalResources.h"

#import "CSMapAnnotation.h"
#import "CSImageAnnotationView.h"


@implementation ObjectMap

- (void) setup:(CGRect) aRect {
    NSLog(@"[ObjectMap: setup]");
    
    currentState = CURRENT_STATE_NONE;
    currentSpeed = 0;
    
    mapView = [[MKMapView alloc] initWithFrame:aRect];
    [mapView setBackgroundColor:[UIColor redColor]];
    mapView.delegate = self;
    
    arrayAllData = [[NSMutableArray alloc] init];
    NSMutableArray *tempArray;
    for (int index = 0; index < 5; index++) {
        tempArray = [[NSMutableArray alloc] init];
        [arrayAllData addObject:tempArray];
    }
    
    [self setupAnnotationUser];
}

- (void) setupAnnotationUser {
    NSLog(@"[ObjectMap: setupAnnotationUser]");

}


- (MKMapView *) getMapView {
    NSLog(@"[ObjectMap: getMapView]");
    return mapView;
    
}

- (void) displayRoute {
    NSLog(@"[ObjectMap: displayRoute]");

    NSMutableArray *arrayLocationObjects = [[NSMutableArray alloc] init];

    // Create Array of Location points

    CLLocationDegrees tempLat;
    CLLocationDegrees tempLong;

    for (int index = 0; index < [[arrayAllData objectAtIndex:DATA_LNG] count]; index++) {
        tempLong = [[[arrayAllData objectAtIndex:DATA_LNG] objectAtIndex:index] doubleValue];
        tempLat  = [[[arrayAllData objectAtIndex:DATA_LAT] objectAtIndex:index] doubleValue];


        CLLocation* currentLocation = [[CLLocation alloc] initWithLatitude:tempLat longitude:tempLong];
        [arrayLocationObjects addObject:currentLocation];
    }

    mapRouteView = [[ObjectMapRouteView alloc] init];
    [mapRouteView setup:arrayLocationObjects arrayAccelX:[arrayAllData objectAtIndex:DATA_ACC_X] arrayAccelY:[arrayAllData objectAtIndex:DATA_ACC_Y]  mapView:mapView];
    [mapView addSubview:mapRouteView];


}

//- (void) displayRoute:(NSMutableArray *) arrayOfData {
//    NSLog(@"[ObjectMap: displayRoute]");
//    
//    NSMutableArray *arrayGpsLng = [arrayOfData objectAtIndex:DATA_LNG];
//    NSMutableArray *arrayGpsLat = [arrayOfData objectAtIndex:DATA_LAT];
//    NSMutableArray *arrayAccelX = [arrayOfData objectAtIndex:DATA_ACC_X];
//    NSMutableArray *arrayAccelY = [arrayOfData objectAtIndex:DATA_ACC_Y];
//    
//    NSMutableArray *arrayLocationObjects = [[NSMutableArray alloc] init];
//    
//    // Create Array of Location points
//    
//    CLLocationDegrees tempLat;
//    CLLocationDegrees tempLong;
//    
//    for (int index = 0; index < [arrayGpsLng count]; index++) {
//        tempLat  = [[arrayGpsLat objectAtIndex:index] doubleValue];
//        tempLong = [[arrayGpsLng objectAtIndex:index] doubleValue];
//        
//        
//        CLLocation* currentLocation = [[CLLocation alloc] initWithLatitude:tempLat longitude:tempLong];
//        [arrayLocationObjects addObject:currentLocation];
//    }
//    
//    mapRouteView = [[ObjectMapRouteView alloc] init];
//    [mapRouteView setup:arrayLocationObjects arrayAccelX:arrayAccelX arrayAccelY:arrayAccelY  mapView:mapView];
//    [mapView addSubview:mapRouteView];
//    
//    
//    
//    // Test Annotations
//    CSMapAnnotation* annotation = nil;
//    
//    // create the start annotation and add it to the array
//    annotation = [[CSMapAnnotation alloc] initWithCoordinate:[[arrayLocationObjects objectAtIndex:0] coordinate]
//                                               annotationType:CSMapAnnotationTypeStart
//                                                        title:@"Start Point"];
//    [mapView addAnnotation:annotation];
//    
//    
//    
//    annotation = [[CSMapAnnotation alloc] initWithCoordinate:[[arrayLocationObjects objectAtIndex:[arrayLocationObjects count]/2] coordinate]
//                                               annotationType:CSMapAnnotationTypeImage
//                                                        title:@""];
//    [annotation setUserData:@"YS.png"];
//    [mapView addAnnotation:annotation];
//
//    annotation = [[CSMapAnnotation alloc] initWithCoordinate:[[arrayLocationObjects objectAtIndex:[arrayLocationObjects count]*3/4] coordinate]
//                                              annotationType:CSMapAnnotationTypeImage
//                                                       title:@""];
//    [annotation setUserData:@"JW.png"];
//    [annotation setCoordinate:[[arrayLocationObjects objectAtIndex:[arrayLocationObjects count]/4] coordinate]];
//    [mapView addAnnotation:annotation];
//
//}


- (void) addGpsCoordinateWithLongitude:(double)aLongitude latitude:(double)aLatitude accelX:(double)anAccelX accelY:(double)anAccelY {
    
    [[arrayAllData objectAtIndex:DATA_LAT] insertObject:[NSNumber numberWithDouble:aLatitude] atIndex:0];
    [[arrayAllData objectAtIndex:DATA_LNG] insertObject:[NSNumber numberWithDouble:aLongitude] atIndex:0];
    [[arrayAllData objectAtIndex:DATA_ACC_X] insertObject:[NSNumber numberWithDouble:anAccelX] atIndex:0];
    [[arrayAllData objectAtIndex:DATA_ACC_Y] insertObject:[NSNumber numberWithDouble:anAccelY] atIndex:0];
    [[arrayAllData objectAtIndex:DATA_TIME] insertObject:[NSNumber numberWithDouble:[GlobalResources getCurrentTime]] atIndex:0];

//    [[arrayAllData objectAtIndex:DATA_LAT] addObject:[NSNumber numberWithDouble:aLatitude]];
//    [[arrayAllData objectAtIndex:DATA_LNG] addObject:[NSNumber numberWithDouble:aLongitude]];
//    [[arrayAllData objectAtIndex:DATA_ACC_X] addObject:[NSNumber numberWithDouble:anAccelX]];
//    [[arrayAllData objectAtIndex:DATA_ACC_Y] addObject:[NSNumber numberWithDouble:anAccelY]];
//    [[arrayAllData objectAtIndex:DATA_TIME] addObject:[NSNumber numberWithDouble:[GlobalResources getCurrentTime]]];
    
//    [arrayLocationPoints addObject:aLocationCoordinate];
    
    
    
    MKCoordinateRegion region;
    region.center.latitude     = aLatitude;
    region.center.longitude    = aLongitude;
    region.span.latitudeDelta  = 0.000001;
    region.span.longitudeDelta  = 0.000001;
    [mapView setRegion:region];
    
    [GlobalResources printAllData:arrayAllData];
    
    CLLocationCoordinate2D tempCoord = CLLocationCoordinate2DMake(aLatitude, aLongitude);
    
    if (!annotationUser) {
        // create the start annotation and add it to the array
        annotationUser = [[CSMapAnnotation alloc] initWithCoordinate:tempCoord
                                                  annotationType:CSMapAnnotationTypeStart
                                                           title:@"User"];
        [mapView addAnnotation:annotationUser];
    } else {
        [annotationUser setCoordinate:tempCoord];
        [mapView addAnnotation:annotationUser];
    }
    
    
    
    if ([[arrayAllData objectAtIndex:0] count] > 1) {
        CLLocation *location1 = [[CLLocation alloc] initWithLatitude:aLatitude longitude:aLongitude];
        
        CLLocation *location2 = [[CLLocation alloc] initWithLatitude:[[[arrayAllData objectAtIndex:DATA_LAT] objectAtIndex:1] doubleValue]
                                                           longitude:[[[arrayAllData objectAtIndex:DATA_LNG] objectAtIndex:1] doubleValue]];
        
        
        
        currentSpeed = [location1 distanceFromLocation:location2] /
        ([[[arrayAllData objectAtIndex:DATA_TIME] objectAtIndex:0] doubleValue] - [[[arrayAllData objectAtIndex:DATA_TIME] objectAtIndex:1] doubleValue]);
    }
    
}

- (double) getCurrentSpeed {
    return currentSpeed;
}



- (double) getTotalDistance {
    
    double totalDistance = 0;
    
    for (int index = 0; index < [[arrayAllData objectAtIndex:DATA_LAT] count]; index++) {
        
        if ([[arrayAllData objectAtIndex:0] count] > 1) {
            CLLocation *location1 = [[CLLocation alloc] initWithLatitude:[[[arrayAllData objectAtIndex:DATA_LAT] objectAtIndex:0] doubleValue]
                                                               longitude:[[[arrayAllData objectAtIndex:DATA_LNG] objectAtIndex:0] doubleValue]];
            
            CLLocation *location2 = [[CLLocation alloc] initWithLatitude:[[[arrayAllData objectAtIndex:DATA_LAT] objectAtIndex:1] doubleValue]
                                                               longitude:[[[arrayAllData objectAtIndex:DATA_LNG] objectAtIndex:1] doubleValue]];
            totalDistance = totalDistance + [location1 distanceFromLocation:location2];
        }
    }
    return totalDistance;
}

- (double) getTotalTime {
    return [[[arrayAllData objectAtIndex:DATA_TIME] objectAtIndex:0] doubleValue] - [[[arrayAllData objectAtIndex:DATA_TIME] objectAtIndex:[[arrayAllData objectAtIndex:DATA_TIME] count]-1] doubleValue];
}

- (double) getAverageIncline {
    return [GlobalResources getTotalFromArrayNumbers:[arrayAllData objectAtIndex:DATA_ACC_Y]] / [[arrayAllData objectAtIndex:DATA_ACC_Y] count];
}




#pragma mark mapView delegate functions
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    [mapRouteView mapViewRegionWillChangeAnimated];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    [mapRouteView mapViewRegionDidChangeAnimated];
}

- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKAnnotationView* annotationView = nil;
    
    // determine the type of annotation, and produce the correct type of annotation view for it.
    CSMapAnnotation* csAnnotation = (CSMapAnnotation*)annotation;
    if([csAnnotation getAnnotationType] == CSMapAnnotationTypeStart ||
       [csAnnotation getAnnotationType] == CSMapAnnotationTypeEnd)
    {
        NSLog(@"[ANNOTATION PIN]");
        NSString* identifier = @"Pin";
        MKPinAnnotationView* pin = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (nil == pin) {
            pin = [[MKPinAnnotationView alloc] initWithAnnotation:csAnnotation reuseIdentifier:identifier];
        }
        [pin setPinColor:([csAnnotation getAnnotationType] == CSMapAnnotationTypeEnd) ? MKPinAnnotationColorRed : MKPinAnnotationColorGreen];
        annotationView = pin;
        
        
        
    } else if ([csAnnotation getAnnotationType] == CSMapAnnotationTypeImage) {
        NSLog(@"[ANNOTATION IMAGE]");
        NSString* identifier = @"Image";
        
        CSImageAnnotationView* imageAnnotationView = (CSImageAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if(nil == imageAnnotationView)
        {
            imageAnnotationView = [[CSImageAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            imageAnnotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        
        annotationView = imageAnnotationView;
    }
    
    [annotationView setEnabled:YES];
    [annotationView setCanShowCallout:YES];
    
    return annotationView;
    
}


- (NSMutableArray *)getDataArray:(int)index {
    return [arrayAllData objectAtIndex:index];
}



@end
