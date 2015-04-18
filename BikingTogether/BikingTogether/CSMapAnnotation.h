//
//  CSMapAnnotation.h
//  mapLines
//
//  Created by Craig on 5/15/09.
//  Copyright 2009 Craig Spitzkoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

// types of annotations for which we will provide annotation views. 
typedef enum {
	CSMapAnnotationTypeStart = 0,
	CSMapAnnotationTypeEnd   = 1,
	CSMapAnnotationTypeImage = 2,
    CSMapAnnotationTypeDot = 3
} CSMapAnnotationType;

@interface CSMapAnnotation : NSObject <MKAnnotation>
{
	CLLocationCoordinate2D coordinate;
	CSMapAnnotationType    annotationType;
	NSString*              title;
	NSString*              userData;
	NSURL*                 url;
}

- (id) initWithCoordinate:(CLLocationCoordinate2D)coordinate
           annotationType:(CSMapAnnotationType) annotationType
                    title:(NSString*)title;

- (NSString*) getUserData;
- (void) setUserData:(NSString*)aUserData;

- (NSURL*) getURL;
- (void) setUrl:(NSURL*)aURL;

- (CSMapAnnotationType) getAnnotationType;
- (void) setAnnotationType:(CSMapAnnotationType) anAnnotationType;

- (CLLocationCoordinate2D) getCoordinate;
- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate;


@end
