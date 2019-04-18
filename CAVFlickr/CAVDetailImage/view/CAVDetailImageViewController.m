//
//  CAVDetailImageViewController.m
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVDetailImageViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface CAVDetailImageViewController ()

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) CIFilter *filter;
@property (nonatomic, strong) CIContext *imageContext;

@end


@implementation CAVDetailImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupView];
}


#pragma mark - Setup

-(void)setupView
{
	self.image = [[UIImageView alloc] initWithFrame: self.view.frame];
	[self.view addSubview:self.image];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 30, self.view.frame.size.width, 30)];
    [self.slider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
	
	ImagesModel* model = [self.presenterOutput getImageURL];
	
    NSURL *url = [NSURL URLWithString:model.largePhotoURL];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    self.currentImage = [UIImage imageWithData:imageData];
//    self.image.image = self.currentImage;
    
    
    
    self.imageContext = [CIContext contextWithOptions:nil];
    CIImage *image = [[CIImage alloc] initWithImage:self.currentImage];
    self.filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, image,
                        @"inputIntensity", @1, nil];
    
    [self.filter setValue:image forKey: kCIInputImageKey];
    
    [self changeFilter];
    
    
}

- (void)sliderValueChanged
{
    [self changeFilter];
}

-(void)changeFilter
{
    [self.filter setValue: @(self.slider.value) forKey:kCIInputIntensityKey];
    CIImage *result = [self.filter valueForKey: @"outputImage"];
    CGImageRef cgImageRef = [self.imageContext createCGImage:result fromRect:[result extent]];
    UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
    self.image.image=targetImage;

}

@end
