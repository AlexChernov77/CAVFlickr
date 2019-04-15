//
//  CAVSearchImagePresenter.h
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAVSearchImagesInteractorProtocol.h"
#import "CAVSearchImagePresenterProtocol.h"
#import "CAVSearchImagesViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAVSearchImagePresenter : NSObject <CAVSearchImagePresenterOutput>

@property (nonatomic, strong, nullable) id<CAVSearchImagesInteractorInput> interaptorInput;
@property (nonatomic, weak, nullable) id<CAVSearchImagesViewProtocol> viewOutput;

@end

NS_ASSUME_NONNULL_END
