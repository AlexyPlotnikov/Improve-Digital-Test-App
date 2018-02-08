//
//  IDTPView.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IDTPView <NSObject>
- (void)refreshPosts;
- (void)showAlert:(NSString *)text;
- (void)showActivity:(BOOL)isShow;
@end
