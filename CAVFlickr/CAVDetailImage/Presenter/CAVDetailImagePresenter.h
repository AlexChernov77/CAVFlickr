//
//  CAVDetailImagePresenter.h
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAVDetailImagePresenterProtocol.h"
#import "ImagesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAVDetailImagePresenter : NSObject <CAVDetailImagePresenterProtocol>

-(instancetype) initWithImageModel: (ImagesModel *)model;

@end

NS_ASSUME_NONNULL_END
