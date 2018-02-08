//
//  ParserRSS.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 06.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSPost.h"
#import "Reachability.h"

@protocol ParserRSSactivity <NSObject> 
-(void)parseDidStartOrEnd:(BOOL)isStarted;
@end

@interface ParserRSS : NSObject<NSXMLParserDelegate>

typedef void(^CallbackParse)(NSArray *posts);
typedef void(^ErrorParse)(NSString *error);

@property (nonatomic, weak) id <ParserRSSactivity> delegate;

-(id)initWithURL:(NSString*)urlString;
-(void)parse:(CallbackParse)callback onError:(ErrorParse)error;

@end
