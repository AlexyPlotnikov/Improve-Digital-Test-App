//
//  IDTPInteractorIO.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ParserRSS.h"

@protocol IDTPInteractorInput <NSObject>
-(void)getPosts;
-(NSString *)formatDateToString:(NSDate*)date;
@end


@protocol IDTPInteractorOutput <NSObject>
-(NSUInteger)postCount;
-(RSSPost *)postAtIndex:(NSInteger)index;
-(NSString *)formatDate:(NSDate*)date;
-(void)didLoadPost:(NSArray *)post;
-(void)setupView;
-(void)alertWithText:(NSString *)text;
-(void)hideActivity:(BOOL)isHide;
@end
