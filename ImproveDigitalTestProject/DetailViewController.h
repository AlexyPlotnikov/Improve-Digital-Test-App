//
//  DetailViewController.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 07.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"
#import "DetailPresenter.h"
#import "RSSPost.h"

@interface DetailViewController : UIViewController<DetailView>

@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;

@property (nonatomic, strong) DetailPresenter*  presenter;
@property (nonatomic, strong) RSSPost *post;

@end
