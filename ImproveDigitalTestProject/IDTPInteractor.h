//
//  IDTPInteractor.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDTPInteractorIO.h"


@interface IDTPInteractor : NSObject<IDTPInteractorInput,ParserRSSactivity>
@property (nonatomic, weak) id<IDTPInteractorOutput> output;



@end
