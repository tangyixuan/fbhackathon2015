//
//  UserInfor.m
//  BikingTogether
//
//  Created by tangyixuan on 19/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "UserInfor.h"

@implementation UserInfor

-(id)initWithNmae:(NSString *)name andImage:(UIImage *)image{
    if (!self){
        self = [super init];
        self.name = name;
        self.image = image;
    }
    return self;
}

@end
