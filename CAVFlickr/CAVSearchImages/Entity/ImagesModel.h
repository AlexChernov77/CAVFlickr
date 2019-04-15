//
//  ImagesModel.h
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagesModel : NSObject

@property (strong, nonatomic, readonly) NSString *photoURL;
@property (strong, nonatomic, readonly) NSString *largePhotoURL;
@property (assign, nonatomic) NSInteger pageCount;

- (instancetype)initWithImageURL : (NSString *) url withLargeImageURL: (NSString *) largeSizeImageURL andpageCount : (NSInteger) pageCount;

@end

NS_ASSUME_NONNULL_END
