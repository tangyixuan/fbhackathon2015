//
//  ObjectMapRoute.m
//  BikeApp
//
//  Created by Jack Wong on 18/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ObjectMapRouteView.h"

@implementation ObjectMapRouteView

- (void) setup:(NSArray *)anArrayLocationPoints arrayAccelX:(NSArray*)anArrayAccelX arrayAccelY:(NSArray*)anArrayAccelY mapView:(MKMapView*) aMapView {
    NSLog(@"[ObjectMapRouteView: setup]");
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self setFrame:CGRectMake(0, 0, aMapView.frame.size.width, aMapView.frame.size.height)];
    [self setUserInteractionEnabled:NO];
    
    mapView = aMapView;
    arrayLocationPoints = anArrayLocationPoints;
    arrayAccelX = anArrayAccelX;
    arrayAccelY = anArrayAccelY;
    
    // Get the bounds of the map
    
    CLLocationDegrees maxLat = -90;
    CLLocationDegrees maxLon = -180;
    CLLocationDegrees minLat = 90;
    CLLocationDegrees minLon = 180;
    
    for(int idx = 0; idx < [arrayLocationPoints count]; idx++)
    {
        CLLocation* currentLocation = [arrayLocationPoints objectAtIndex:idx];
        if(currentLocation.coordinate.latitude > maxLat)
            maxLat = currentLocation.coordinate.latitude;
        if(currentLocation.coordinate.latitude < minLat)
            minLat = currentLocation.coordinate.latitude;
        if(currentLocation.coordinate.longitude > maxLon)
            maxLon = currentLocation.coordinate.longitude;
        if(currentLocation.coordinate.longitude < minLon)
            minLon = currentLocation.coordinate.longitude;
    }
    
    NSLog(@"[ObjectMapRouteView: displayRoute] max bounds: lat[%.6f,%.6f] lng[%.6f,%.6f]", minLat, maxLat, minLon, maxLon);
    
    
    MKCoordinateRegion region;
    region.center.latitude     = (maxLat + minLat) / 2;
    region.center.longitude    = (maxLon + minLon) / 2;
    region.span.latitudeDelta  = (maxLat - minLat) * 1.1;
    region.span.longitudeDelta = (maxLon - minLon) * 1.1;

    [mapView setRegion:region];
    
    NSLog(@"[ObjectMapRouteView: setup] arrayCount: %d", (int)[arrayLocationPoints count]);
}



- (void)drawRect:(CGRect)rect {
    
    NSLog(@"[ObjectMapRouteView: drawRect] pointCount: %d", (int)[arrayLocationPoints count]);
    // only draw our lines if we're not int he moddie of a transition and we
    // acutally have some points to draw.
    if(!self.hidden && nil != arrayLocationPoints && [arrayLocationPoints count] > 0)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        UIColor *tempColor;
        
        // Draw them with a 2.0 stroke width so they are a bit more visible.
        CGContextSetLineWidth(context, 2.0);
        
        for(int idx = 0; idx < [arrayLocationPoints count]; idx++)
        {
            if (idx != 0) {
                CLLocation* location = [arrayLocationPoints objectAtIndex:idx];
                CLLocation* locationPrev = [arrayLocationPoints objectAtIndex:idx-1];
                CGPoint point = [mapView convertCoordinate:location.coordinate toPointToView:self];
                CGPoint pointPrev = [mapView convertCoordinate:locationPrev.coordinate toPointToView:self];
                
                tempColor = [self getColorFromAltitude:[[arrayAccelY objectAtIndex:idx] doubleValue]];
                
                CGContextSetStrokeColorWithColor(context, tempColor.CGColor);

                CGContextMoveToPoint(context, point.x, point.y);
                CGContextAddLineToPoint(context, pointPrev.x, pointPrev.y);
                CGContextStrokePath(context);
            }
        }
    }
}

- (UIColor*) getColorFromAltitude:(double)anAccel {
    
    float max = 45;
    float min = -45;
    float diff = max - min;
    double accel = anAccel;
    if (accel > max) {
        accel = max;
    } else if (accel < min) {
        accel = min;
    }
    float percentage = (45 - accel)/diff;
    return [UIColor colorWithRed:(1-percentage) green:percentage*1.5 blue:0 alpha:1];
}


//#pragma mark mapView delegate functions
//- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
//    self.hidden = YES;
//}
//
//- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
//    self.hidden = NO;
//    [self setNeedsDisplay];
//}
//

- (void)mapViewRegionWillChangeAnimated {
    self.hidden = YES;
}

- (void)mapViewRegionDidChangeAnimated {
    self.hidden = NO;
    [self setNeedsDisplay];
}








@end
