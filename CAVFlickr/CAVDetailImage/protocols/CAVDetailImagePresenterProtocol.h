//
//  CAVDetailImagePresenterProtocol.h
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CAVDetailImagePresenterProtocol <NSObject>

-(ImagesModel *)getImageURL;

@end

NS_ASSUME_NONNULL_END
