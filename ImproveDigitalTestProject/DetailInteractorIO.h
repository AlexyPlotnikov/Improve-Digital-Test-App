//
//  DetailInteractorIO.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 07.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <UIKit/UIKit.h>


@protocol DetailInteractorInput <NSObject>

@end


@protocol DetailInteractorOutput <NSObject>
-(void)getPostInfo;

@end

