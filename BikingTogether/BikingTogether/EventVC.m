//
//  EventVC.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "EventVC.h"

@interface EventVC ()

@property (nonatomic) UITableView *tableview;

-(void)startTapped;

@end

@implementation EventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:self.event.des];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)];
    [self.tableview setDelegate:self];
    [self.tableview setDataSource:self];
    [self.view addSubview:self.tableview];

    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"group2.png"]];
    [imageView setFrame:CGRectMake(0, 170, self.view.frame.size.width,370)];    [self.view addSubview:imageView];
    

    UIBarButtonItem *startButton = [[UIBarButtonItem alloc]initWithTitle:@"start" style:UIBarButtonItemStylePlain target:self action:@selector(startTapped)];
    self.navigationItem.rightBarButtonItem = startButton;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startTapped{
    RidingMapVC *ridingMapVC = [[RidingMapVC alloc]init];
    [self.navigationController pushViewController:ridingMapVC animated:YES];
}

-(void)addFriendTapped{
    FriendForEventVC *friendForEventVC = [[FriendForEventVC alloc]init];
    [self.navigationController pushViewController:friendForEventVC animated:YES];
    
}

#pragma mark - tableview datasource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

            return 2;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

            NSString *identifier = @"eventInfoCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if(!cell){
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            }
            
            switch (indexPath.row) {
                case 0:
                    [cell.textLabel setText:@"Start Time"];
                    [cell.detailTextLabel setText:self.event.date];
                    break;
                case 1:
                    [cell.textLabel setText:@"Meeting Place"];
                    [cell.detailTextLabel setText:self.event.meetingPlace];
                    break;
                default:
                    break;
            }
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
