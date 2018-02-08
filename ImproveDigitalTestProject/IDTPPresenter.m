//
//  IDTPPresenter.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "IDTPPresenter.h"


@implementation IDTPPresenter{
    NSArray *posts;
}

- (void)setupView {
    [self.interactor getPosts];
}

-(NSUInteger)postCount {
    return [posts count];
}
-(void)hideActivity:(BOOL)isHide{
    [self.view showActivity:isHide];
}

-(RSSPost *)postAtIndex:(NSInteger)index {
    return posts[index];
}

-(void)didLoadPost:(NSArray *)post {
    posts = post;
    [self.view refreshPosts];
}

-(void)alertWithText:(NSString *)text{
    [self.view showAlert:text];
}

-(NSString *)formatDate:(NSDate *)date{
    return [self.interactor formatDateToString:date];
}
@end
