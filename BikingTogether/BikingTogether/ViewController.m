//
//  ViewController.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


// Hello!


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIImage *image = [UIImage imageNamed:@"login.jpg"];
    self.imageView.image = image;
    
    
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
//    gradient.colors = @[[UIColor redColor],//colorWithRed:134.0/255 green:187.0/255 blue:1 alpha:0.5],
//                        [UIColor blackColor], //colorWithRed:242.0/255 green:250.0/255 blue:1 alpha:0.5],
//                        ];
//    
//    [self.view.layer insertSublayer:gradient atIndex:0];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)loginTapped:(id)sender {
    TabVC *tabVC = [self.storyboard instantiateViewControllerWithIdentifier:@"tabViewController"];
    [self presentViewController:tabVC animated:YES completion:nil];
}


@end
