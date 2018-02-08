//
//  RSSPost.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSPost : NSObject

@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSURL* link;
@property (nonatomic, retain) NSString* descriptionText;
@property (nonatomic, retain) NSDate* pubDate;


-(void) setValue:(NSString*)value forProperty:(NSString*)property;



@end
