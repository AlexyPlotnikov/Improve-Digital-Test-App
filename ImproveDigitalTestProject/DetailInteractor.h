//
//  DetailInteractor.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 07.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailInteractorIO.h"


@interface DetailInteractor : NSObject<DetailInteractorInput>
@property (nonatomic, weak) id<DetailInteractorOutput> output;

@end
