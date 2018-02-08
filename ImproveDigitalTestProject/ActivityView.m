//
//  ActivityView.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 08.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "ActivityView.h"

@implementation ActivityView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
 
    if(self=[super initWithCoder:aDecoder]){
        [self initialize];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{

    if(self= [super initWithFrame:frame]){
        [self initialize];
    }
    
    return self;
}

-(void)initialize{
    self.backgroundColor=[UIColor colorWithRed:0.f/255.f green:0.f/255.f blue:0.f/255.f alpha:0.5f];
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicator startAnimating];
    [activityIndicator setCenter:self.center];
    [self addSubview:activityIndicator];

}
@end
