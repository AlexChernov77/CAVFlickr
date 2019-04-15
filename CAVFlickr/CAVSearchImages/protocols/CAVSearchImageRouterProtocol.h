//
//  CAVSearchImageRouterProtocol.h
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesModel.h"
#import "CAVSearchImagesViewController.h"


@protocol CAVSearchImageRouterProtocol <NSObject>

- (void) showDetail: (ImagesModel *) model;

@end

