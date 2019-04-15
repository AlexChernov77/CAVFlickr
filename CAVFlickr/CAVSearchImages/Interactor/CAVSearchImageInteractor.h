//
//  CAVSearchImageInteractor.h
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAVSearchImagesInteractorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAVSearchImageInteractor : NSObject <CAVSearchImagesInteractorInput>

@property id<CAVSearchImagesInteractorOutput> presenterOutput;

@end

NS_ASSUME_NONNULL_END
