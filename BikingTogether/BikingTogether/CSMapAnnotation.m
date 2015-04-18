//
//  CSMapAnnotation.m
//  mapLines
//
//  Created by Craig on 5/15/09.
//  Copyright 2009 Craig Spitzkoff. All rights reserved.
//

#import "CSMapAnnotation.h"


@implementation CSMapAnnotation

@synthesize coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D)aCoordinate
		  annotationType:(CSMapAnnotationType) anAnnotationType
				   title:(NSString*)aTitle
{
	self = [super init];
	coordinate = aCoordinate;
	title      = aTitle;
	annotationType = anAnnotationType;
	
	return self;
}

- (NSString *)title {
	return title;
}

- (NSString *)subtitle {
	NSString* subtitle = nil;
	
	if(annotationType == CSMapAnnotationTypeStart || annotationType == CSMapAnnotationTypeEnd) {
		subtitle = [NSString stringWithFormat:@"%lf, %lf", coordinate.latitude, coordinate.longitude];
	}
	
	return subtitle;
}

- (NSString*) getUserData {
    return userData;
}
- (void) setUserData:(NSString*)aUserData {
    userData = aUserData;
}
- (NSURL*) getURL {
    return url;
}
- (void) setUrl:(NSURL*)aURL {
    url = aURL;
}
- (CSMapAnnotationType) getAnnotationType {
    return annotationType;
}
- (void) setAnnotationType:(CSMapAnnotationType) anAnnotationType {
    annotationType = anAnnotationType;
}

- (CLLocationCoordinate2D) coordinate {
    return coordinate;
}
- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    coordinate = newCoordinate;
}





@end
