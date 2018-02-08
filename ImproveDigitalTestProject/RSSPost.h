//
//  RSSPost.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSPost : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* link;
@property (nonatomic, strong) NSString* descriptionText;
@property (nonatomic, strong) NSDate* pubDate;


-(void) setValue:(NSString*)value forProperty:(NSString*)property;



@end
