//
//  GlobalResources.h
//  iUtilityBelt
//
//  Created by Jack Wong on 6/04/13.
//  Copyright (c) 2013 Jack Wong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SingletonAccelerator.h"
#import "SingletonGPS.h"

// This is to decode test GPS / Accel data
#define DATA_CSV_LNG 1
#define DATA_CSV_LAT 2
#define DATA_CSV_ACC_X 3
#define DATA_CSV_ACC_Y 4

#define DATA_LNG 0
#define DATA_LAT 1
#define DATA_ACC_X 2
#define DATA_ACC_Y 3
#define DATA_TIME 4


#define CURRENT_STATE_NONE 0
#define CURRENT_STATE_STREAMING 1
#define CURRENT_STATE_FINISHED 2

@interface GlobalResources : NSObject

+ (int) getScreenHeight;
+ (int) getScreenWidth;
+ (void) printRect: (CGRect) rect;
+ (double) getCurrentTime;

+ (NSArray *) getLinesFromTextFile: (NSString *)fileName;
+ (UIColor *) getColorFromRGB:(int)red :(int)blue :(int)green;

+ (int) getIOSVersion;
+ (NSString *) getDeviceModel;

+ (void) showAlert:(NSString*)aTitle message:(NSString*)aMessage cancelTitle:(NSString*)aCancelTitle;
+ (float) getAbsFloat:(float) aFloat;


+ (NSMutableArray *) getArraysFromGpsCsvFile: (NSString *)fileName;

+ (void) printAllData: (NSMutableArray*) arrayAllData;

+ (double) getTotalFromArrayNumbers:(NSMutableArray *)anArray;

@end
