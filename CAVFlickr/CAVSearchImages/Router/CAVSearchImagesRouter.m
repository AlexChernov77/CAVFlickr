//
//  CAVSearchImagesRouter.m
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVSearchImagesRouter.h"
#import "CAVSearchImageRouterProtocol.h"
#import "CAVSearchImagesViewController.h"
#import "CAVSearchImagePresenter.h"
#import "CAVSearchImageInteractor.h"
#import "CAVDetailImageViewController.h"
#import "CAVDetailImageAssembly.h"

@interface CAVSearchImagesRouter() <CAVSearchImageRouterProtocol>

@property (weak, nonatomic) UIViewController *rootViewController;

@end

@implementation CAVSearchImagesRouter

- (void)showDetail:(ImagesModel *)model
{
	CAVDetailImageAssembly *vc = [CAVDetailImageAssembly new];
	
	[self.rootViewController.navigationController pushViewController:[vc setupSearchImageModule:model] animated:NO];
}

- (CAVSearchImagesViewController *)setupSearchImageModule
{
	CAVSearchImagesViewController *viewController = [CAVSearchImagesViewController new];
	CAVSearchImagePresenter *presenter = [CAVSearchImagePresenter new];
	CAVSearchImageInteractor *interactor = [CAVSearchImageInteractor new];
	
	self.rootViewController = viewController;
	
	viewController.presenterOutput = presenter;
	presenter.viewOutput = viewController;
	presenter.interaptorInput = interactor;
	presenter.routerDelegate = self;
	
	return viewController;
}

@end
