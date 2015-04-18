//
//  PlanListVC.m
//  BikingTogether
//
//  Created by tangyixuan on 18/4/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "PlanListVC.h"

@interface PlanListVC ()

@property(nonatomic) NSMutableArray *planList;

-(void)addTapped;
-(void)updatePlanList;

@end

@implementation PlanListVC

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self updatePlanList];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"Plan List"];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(addTapped)];
    self.navigationItem.rightBarButtonItem = addButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTapped{
    NewEventVC *newEventVC = [[NewEventVC alloc]init];
    [self.navigationController pushViewController:newEventVC animated:YES];

}

-(void)updatePlanList{
    //need to change this mathod later
    //will read plans from the server
    if (!self.planList){
        Event *event1 = [[Event alloc]initWithEventID:@"1darling"];
        Event *event2 = [[Event alloc]initWithEventID:@"2UNSW"];
        
        self.planList = [[NSMutableArray alloc]initWithObjects:event1,event2, nil];
    }
}

#pragma mark - tableview datasource and delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"plans:  %d",(int)[self.planList count]);
    return [self.planList count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"planListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        Event *event = (Event *)[self.planList objectAtIndex:indexPath.row];
        [cell.textLabel setText:event.des];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EventVC *eventVC = [[EventVC alloc]init];
    eventVC.event = [self.planList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:eventVC animated:YES];
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
