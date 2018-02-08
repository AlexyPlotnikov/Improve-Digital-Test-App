//
//  ViewController.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 01.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDTPView.h"
#import "MainTableViewCell.h"
#import "IDTPPresenter.h"

@interface ViewController : UIViewController<IDTPView,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) IDTPPresenter*  presenter;

@end

