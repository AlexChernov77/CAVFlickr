//
//  CAVSearchImagesViewController.h
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAVSearchImagePresenterProtocol.h"
#import "CAVSearchImagesViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAVSearchImagesViewController : UIViewController <CAVSearchImagesViewProtocol>

@property (nonatomic, strong, nullable) id<CAVSearchImagePresenterOutput> presenterOutput;

@end

NS_ASSUME_NONNULL_END
