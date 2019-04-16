//
//  CAVDetailImageViewController.m
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVDetailImageViewController.h"

@interface CAVDetailImageViewController ()

@property (nonatomic, strong) UIImageView *image;

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
}


@end
