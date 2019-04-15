//
//  CAVSearchImagesAssembly.m
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVSearchImagesAssembly.h"
#import "CAVSearchImagesRouter.h"
#import "CAVSearchImageRouterProtocol.h"
#import "CAVSearchImagesViewController.h"
#import "CAVSearchImagePresenter.h"
#import "CAVSearchImageInteractor.h"

@implementation CAVSearchImagesAssembly

- (CAVSearchImagesViewController *)setupSearchImageModule
{
    CAVSearchImagesViewController *viewController = [CAVSearchImagesViewController new];
    CAVSearchImagePresenter *presenter = [CAVSearchImagePresenter new];
    CAVSearchImageInteractor *interactor = [CAVSearchImageInteractor new];
    
    viewController.presenterOutput = presenter;
    presenter.viewOutput = viewController;
    presenter.interaptorInput = interactor;
    
    return viewController;
}

@end
