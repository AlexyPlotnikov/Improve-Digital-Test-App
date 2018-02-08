//
//  ViewController.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 01.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "ViewController.h"
#import "DetailRouter.h"
#import "ActivityView.h"

@interface ViewController (){
    ActivityView *activity;
    UIRefreshControl* refreshControl;
}
@end

NSString * const TableViewCellIdentifier = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addActivity];
    [self.presenter setupView];
}



-(void)addActivity{
    activity=[[ActivityView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:activity];
    refreshControl = [[UIRefreshControl alloc]init];
    [self.table addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
}

-(void)refreshTable{
    [self.presenter setupView];
    
}
-(void)refreshPosts{
    [refreshControl endRefreshing];
    [self.table reloadData];
}

-(void)showAlert:(NSString *)text{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Warning!" message:text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)showActivity:(BOOL)isShow{
     [activity setHidden:!isShow];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.presenter postCount];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
    RSSPost *post = [self.presenter postAtIndex:indexPath.row];
    cell.title.text = post.title;
    cell.title.adjustsFontSizeToFitWidth=YES;
    cell.descriptionText.text = post.descriptionText;
    cell.date.text = [self.presenter formatDate:post.pubDate];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_async(dispatch_get_main_queue(), ^{
    RSSPost *post = [self.presenter postAtIndex:indexPath.row];
    UIViewController* viewController = [DetailRouter provide:post];
    [self  presentViewController:viewController animated:YES completion:nil];
         });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
