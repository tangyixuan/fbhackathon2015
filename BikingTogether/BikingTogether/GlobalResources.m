//
//  GlobalResources.m
//  iUtilityBelt
//
//  Created by Jack Wong on 6/04/13.
//  Copyright (c) 2013 Jack Wong. All rights reserved.
//

#import "GlobalResources.h"
#import <sys/sysctl.h>
#include <sys/utsname.h>


@implementation GlobalResources

+ (int) getScreenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}


+ (int) getScreenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (void) printRect :(CGRect)rect{
    NSLog(@"[GlobalResources: printRect]\tx: %d\ty:%d\twidth:%d\theight:%d", (int)rect.origin.x,(int)rect.origin.y,(int)rect.size.width,(int)rect.size.height);
}

+ (double) getCurrentTime {
    return [NSDate timeIntervalSinceReferenceDate];
}

+ (NSArray *) getLinesFromTextFile:(NSString *)fileName {
    // read external file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSString *fileString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return [fileString componentsSeparatedByString:@"\n"];
}

+ (NSMutableArray *) getArraysFromGpsCsvFile: (NSString *)fileName {
    NSLog(@"[GlobalResources: getArraysFromGpsCsvFile]");
    NSMutableArray *allArrays = [[NSMutableArray alloc] init];

    NSMutableArray *tempArray;
    NSNumber *tempNumber;
    
    for (int index = 0; index < 4; index++) {
        tempArray = [[NSMutableArray alloc] init];
        [allArrays addObject:tempArray];
    }
    

    NSMutableArray *allLines = [NSMutableArray arrayWithArray: [GlobalResources getLinesFromTextFile:fileName]];
    NSArray *stringSplitComponents;
    
    for (int index = 1; index < [allLines count]; index++) {
        stringSplitComponents = [[allLines objectAtIndex:index] componentsSeparatedByString:@","];
        
        // Add Longitude, Latitude, AccelX, AccelY
        for (int indexInner = 0; indexInner < 4; indexInner++) {
            if (indexInner < [stringSplitComponents count]) {
                tempNumber = [NSNumber numberWithDouble: [[stringSplitComponents objectAtIndex:indexInner+1] doubleValue]];
            } else {
                tempNumber = [NSNumber numberWithDouble:0];
            }
            [[allArrays objectAtIndex:indexInner] addObject:tempNumber];
        }
    }
    
    return allArrays;
}


+ (UIColor*) getColorFromRGB:(int)red :(int)blue :(int)green {
    return [UIColor colorWithRed:(red*1.0)/255 green:(blue*1.0)/255 blue:(green*1.0)/255 alpha:1.0];
}

+ (int) getIOSVersion {
    return [[[UIDevice currentDevice] systemVersion] intValue];
}

+ (NSString *) getDeviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
//    NSLog(@"[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]: %@",[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
//    NSLog(@"Platform: %@", deviceModel);
    
//    
//    return platform;
//}
//    
    return deviceModel;
}

+ (void) showAlert:(NSString*)aTitle message:(NSString*)aMessage cancelTitle:(NSString*)aCancelTitle {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle
                                                    message:aMessage
                                                   delegate:nil
                                          cancelButtonTitle:aCancelTitle
                                          otherButtonTitles:nil];
    [alert show];
}


+ (float) getAbsFloat:(float) aFloat {
    float returnFloat = aFloat;
    if (returnFloat < 0)
        returnFloat = returnFloat * -1;
    return returnFloat;
}

+ (void) printAllData:(NSMutableArray *)arrayAllData {
    NSLog(@"[GlobalResources: printAllData]");
    
    for (int index = 0; index < [[arrayAllData objectAtIndex:0]count]; index++) {
        NSLog(@"GPS: %.6f\t%.6f\tAccel: %.3f\t%.3f\tTime:%.2f", [[[arrayAllData objectAtIndex:DATA_LNG] objectAtIndex:index] doubleValue],
              [[[arrayAllData objectAtIndex:DATA_LAT] objectAtIndex:index] doubleValue],
              [[[arrayAllData objectAtIndex:DATA_ACC_X] objectAtIndex:index] doubleValue],
              [[[arrayAllData objectAtIndex:DATA_ACC_Y] objectAtIndex:index] doubleValue],
              [[[arrayAllData objectAtIndex:DATA_TIME] objectAtIndex:index] doubleValue]);
    }
}

+ (double) getTotalFromArrayNumbers:(NSMutableArray *)anArray {
    double total = 0;
    
    for (int index = 0; index < [anArray count]; index++) {
        total = total + [[anArray objectAtIndex:index] doubleValue];
    }
    return total;
}




@end
