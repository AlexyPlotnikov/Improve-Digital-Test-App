//
//  DetailPresenter.h
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 07.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailView.h"
#import "DetailInteractorIO.h"

@interface DetailPresenter : NSObject <DetailInteractorOutput>
@property (nonatomic, weak)     id<DetailView> view;
@property (nonatomic, strong)   id<DetailInteractorInput> interactor;


@end
