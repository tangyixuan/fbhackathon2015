//
//  FriendListVC.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "FriendListVC.h"

@interface FriendListVC ()

-(void)addTapped;
-(void)getFriendList;

@end

@implementation FriendListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getFriendList];
    
    [self.navigationItem setTitle:@"Friends"];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(addTapped)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTapped{

}

-(void)getFriendList{
    NSArray *names = [[NSArray alloc]initWithObjects:@"Esther",@"Tom",@"Emma",@"Johnathon",nil];
    NSArray *imageNames = [[NSArray alloc]initWithObjects:@"image1",@"image2",@"image3",@"image4",nil];
    
    for (int i=0;i<[names count];i++){
        NSString *name = [names objectAtIndex:(NSInteger)i];
        UIImage *image = [UIImage imageNamed:[imageNames objectAtIndex:(NSInteger)i]];
        UserInfor *user = [[UserInfor alloc]initWithNmae:name andImage:image];
        [self.friendList addObject:user];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
