//
//  CAVDetailImageViewController.h
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAVDetailImagePresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAVDetailImageViewController : UIViewController

@property (nonatomic, strong, nullable) id<CAVDetailImagePresenterProtocol> presenterOutput;

@end

NS_ASSUME_NONNULL_END
