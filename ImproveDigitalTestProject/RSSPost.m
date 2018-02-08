//
//  RSSPost.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "RSSPost.h"

@implementation RSSPost

-(void) setValue:(NSString*)value forProperty:(NSString*)property {
    
    if ([property isEqualToString:@"link"]) {
        value = [value stringByReplacingOccurrencesOfString:@" " withString:@""];
        _link = [NSURL URLWithString:value];
        
    } else
        if ([property isEqualToString:@"pubDate"]) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
        _pubDate = [dateFormat dateFromString:value];
    } else
        if ([property isEqualToString:@"description"]) {
        _descriptionText = value;
    }else
        if([property isEqualToString:@"title"]){
        _title= value;
    }
    
}


@end
