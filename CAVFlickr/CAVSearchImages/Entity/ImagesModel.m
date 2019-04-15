//
//  ImagesModel.m
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "ImagesModel.h"

@interface ImagesModel()

@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *largePhotoURL;

@end


@implementation ImagesModel

- (instancetype)initWithImageURL : (NSString *) url withLargeImageURL: (NSString *) largeSizeImageURL andpageCount : (NSInteger) pageCount
{
    if ( self = [super init])
    {
        _photoURL = url;
        _largePhotoURL = largeSizeImageURL;
        _pageCount = pageCount;
    }
    return self;
}

@end
