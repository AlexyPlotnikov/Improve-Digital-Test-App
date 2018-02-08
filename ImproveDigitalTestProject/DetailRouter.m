//
//  DetailRouter.m
//  ImproveDigitalTestProject
//
//  Created by VertuLeha on 07.02.18.
//  Copyright © 2018 Alexey Plotnikov. All rights reserved.
//

#import "DetailRouter.h"
#import "DetailInteractorIO.h"
#import "DetailViewController.h"
#import "DetailPresenter.h"
#import "DetailInteractor.h"

@implementation DetailRouter

+(UIViewController *)provide:(RSSPost *)post{
        DetailInteractor* interactor = [[DetailInteractor alloc]init];
        DetailViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Detail"];
        DetailPresenter *presenter = [[DetailPresenter alloc]init];
        viewController.presenter=presenter;
        presenter.view = viewController;
        presenter.interactor = interactor;
        interactor.output = presenter;
        viewController.post=post;
        return viewController;

}
@end
