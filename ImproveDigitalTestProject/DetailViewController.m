//
//  DetailViewController.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 07.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.presenter getPostInfo];
}


-(void)loadInfo{
    self.titleText.text=self.post.title;
    self.titleText.adjustsFontSizeToFitWidth=YES;
    self.descriptionText.text=self.post.descriptionText;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToBrowser:(id)sender {
    if(self.post.link){
        [[UIApplication sharedApplication] openURL:self.post.link];
    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Sorry!" message:@"Link can not be opened" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)closeWindow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
