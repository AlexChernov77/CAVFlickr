//
//  CAVImageSearchCollectionViewCell.h
//  CAVFlickr
//
//  Created by Александр on 14/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAVImageSearchCollectionViewCell : UICollectionViewCell

- (void)bind:(ImagesModel *) model;

@end 

NS_ASSUME_NONNULL_END
