//
//  ObjectUser.h
//  BikingTogether
//
//  Created by Jack Wong on 19/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ObjectUser : NSObject {
    NSString *name;
    NSString *facebookID;
    UIImage *displayPicture;
}

- (void) setup;
- (void) setName:(NSString*)aName;
- (void) setFacebookID:(NSString*)aFacebookID;
- (void) setDisplayPicture:(UIImage*)anImage;

@end
