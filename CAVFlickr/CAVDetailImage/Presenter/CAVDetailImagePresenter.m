//
//  CAVDetailImagePresenter.m
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVDetailImagePresenter.h"

@interface CAVDetailImagePresenter()

@property (strong, nonatomic) ImagesModel *model;

@end

@implementation CAVDetailImagePresenter


-(instancetype) initWithImageModel: (ImagesModel *)model
{
	if (self = [super init])
	{
		_model = model;
	}
	return self;
}

- (ImagesModel *)getImageURL
{
	return self.model;
}

@end
