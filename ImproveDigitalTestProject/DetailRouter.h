//
//  DetailRouter.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 07.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RSSPost.h"

@interface DetailRouter : NSObject

+(UIViewController*)provide:(RSSPost*)post;
@end
