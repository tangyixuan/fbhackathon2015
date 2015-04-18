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
    [self.tableView reloadData];
    
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
    if (!self.friendList) {
        self.friendList = [[NSMutableArray alloc]init];
    }
    NSArray *names = [[NSArray alloc]initWithObjects:@"Lizzy",@"James",@"Doris",@"Esther",nil];
    NSArray *imageNames = [[NSArray alloc]initWithObjects:@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",nil];
    
    for (int i=0;i<[names count];i++){
        NSString *name = [names objectAtIndex:(NSInteger)i];
        UIImage *image = [UIImage imageNamed:[imageNames objectAtIndex:(NSInteger)i]];
        UserInfor *user = [[UserInfor alloc]initWithNmae:name andImage:image];
        [self.friendList addObject:user];

    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.friendList count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"in");
    static NSString *friendCellIdentifier = @"fiendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:friendCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:friendCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    UserInfor *friend = [self.friendList objectAtIndex:indexPath.row];
   
    [cell.textLabel setText:friend.name];
    NSLog(@"%@",cell.textLabel.text);
    [cell.imageView setImage:friend.image];
    
    return cell;
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
