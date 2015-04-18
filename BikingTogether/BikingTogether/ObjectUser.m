//
//  ObjectUser.m
//  BikingTogether
//
//  Created by Jack Wong on 19/04/2015.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ObjectUser.h"

@implementation ObjectUser

- (void) setup {
    NSLog(@"[ObjectUser: setup]");
    name = @"";
    facebookID = @"";
    displayPicture = [UIImage imageNamed:@"blank.png"];
}

- (void) setName:(NSString*)aName {
    name = aName;
}
- (void) setFacebookID:(NSString*)aFacebookID {
    facebookID = aFacebookID;
}
- (void) setDisplayPicture:(UIImage*)anImage {
    displayPicture = anImage;
}

- (NSString*) getName {
    return name;
}
- (NSString*) getFacebookID {
    return facebookID;
}
- (UIImage*) getDisplayPicture {
    return displayPicture;
}


@end
