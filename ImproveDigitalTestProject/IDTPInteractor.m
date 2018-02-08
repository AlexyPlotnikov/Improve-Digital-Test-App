//
//  IDTPInteractor.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "IDTPInteractor.h"



@implementation IDTPInteractor

-(void)getPosts{
   

    Reachability* reach= [Reachability reachabilityWithHostname:@"www.google.com"];
    [reach startNotifier];
    
    reach.reachableBlock = ^(Reachability*reach)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            ParserRSS *parser = [[ParserRSS alloc]initWithURL:@"http://lenta.ru/rss"];
            parser.delegate=self;
            [parser  parse:^(NSArray *posts) {
                [self.output didLoadPost:posts];
            } onError:^(NSString *error) {
                [self.output alertWithText:error];
            }];
        });
    };
    
    reach.unreachableBlock = ^(Reachability*reach)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.output hideActivity:YES];
            [self.output alertWithText:@"No internet connection"];
       });
    };
    
   
}

-(void)parseDidStartOrEnd:(BOOL)isStarted{
    [self.output hideActivity:isStarted];
}

-(NSString *)formatDateToString:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"dd.MM.yyyy"];
    NSString *string =[formatter stringFromDate:date];
    return string;
}
@end
