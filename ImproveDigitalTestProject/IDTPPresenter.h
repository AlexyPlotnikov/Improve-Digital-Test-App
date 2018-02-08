//
//  IDTPPresenter.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 05.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDTPView.h"
#import "IDTPInteractorIO.h"

@interface IDTPPresenter : NSObject <IDTPInteractorOutput>
@property (nonatomic, weak)     id<IDTPView> view;
@property (nonatomic, strong)   id<IDTPInteractorInput> interactor;


@end
