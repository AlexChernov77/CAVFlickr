//
//  CAVDetailImageAssembly.m
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVDetailImageAssembly.h"
#import "CAVDetailImagePresenter.h"

@implementation CAVDetailImageAssembly 

- (CAVDetailImageViewController *)setupSearchImageModule: (ImagesModel *)model
{
	CAVDetailImageViewController *viewController = [CAVDetailImageViewController new];
	CAVDetailImagePresenter *presenter = [[CAVDetailImagePresenter alloc] initWithImageModel:model];
	viewController.presenterOutput = presenter;
	
	return viewController;
}

@end
