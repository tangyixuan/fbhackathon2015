//
//  UserInfor.h
//  BikingTogether
//
//  Created by tangyixuan on 19/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserInfor : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) UIImage *image;

-(id)initWithNmae:(NSString *)name andImage:(UIImage *)image;

@end
