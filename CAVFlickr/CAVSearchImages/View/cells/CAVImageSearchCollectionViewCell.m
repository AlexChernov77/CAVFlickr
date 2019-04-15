//
//  CAVImageSearchCollectionViewCell.m
//  CAVFlickr
//
//  Created by Александр on 14/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVImageSearchCollectionViewCell.h"
#import "ImagesModel.h"
#import "SDWebImage/UIImageView+WebCache.h"


@interface CAVImageSearchCollectionViewCell()

@property (strong, nonatomic) UIImageView *imageCell;

@end


@implementation CAVImageSearchCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setupView];
    
    return self;
}


#pragma mark - Setup and Layouts

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageCell.frame = self.contentView.frame;
}

- (void)setupView
{
    self.contentView.backgroundColor = UIColor.clearColor;
    self.imageCell = [UIImageView new];
    [self.contentView addSubview:self.imageCell];
    self.imageCell.layer.cornerRadius = 20;
    self.imageCell.clipsToBounds = YES;
    self.imageCell.layer.borderWidth = 2;
}

#pragma marks - Configure

- (void)bind:(ImagesModel *) model
{
    [self.imageCell sd_setImageWithURL:[NSURL URLWithString:model.largePhotoURL]];
}

@end
