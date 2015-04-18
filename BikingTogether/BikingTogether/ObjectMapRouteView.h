//
//  ObjectMapRoute.h
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ObjectMapRouteView : UIView {
    MKMapView *mapView;
    NSArray *arrayLocationPoints;
    NSArray *arrayAccelX;
    NSArray *arrayAccelY;
}

- (void) setup:(NSArray *)anArrayLocationPoints arrayAccelX:(NSArray*)anArrayAccelX arrayAccelY:(NSArray*)anArrayAccelY mapView:(MKMapView*) aMapView;

- (void)mapViewRegionWillChangeAnimated;
- (void)mapViewRegionDidChangeAnimated;

@end
