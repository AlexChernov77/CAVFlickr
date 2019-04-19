//
//  CAVDetailImageViewController.m
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVDetailImageViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "CAVNSUserdefaultService.h"
@import UserNotifications;


@interface CAVDetailImageViewController ()

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic, strong) CIFilter *filter;
@property (nonatomic, strong) CIContext *imageContext;
@property (nonatomic, strong) CAVNSUserdefaultService *service;

@end


@implementation CAVDetailImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
	self.service = [CAVNSUserdefaultService new];
	[self sheduleLocalNotification];
	[self setupView];
	[self setupFilterButton];
}


#pragma mark - Setup

- (void)setupView
{
	self.image = [[UIImageView alloc] initWithFrame: self.view.frame];
	[self.view addSubview:self.image];
	
	ImagesModel* model = [self.presenterOutput getImageURL];
	
    NSURL *url = [NSURL URLWithString:model.largePhotoURL];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    self.currentImage = [UIImage imageWithData:imageData];
    
	self.image.image = self.currentImage;
    
    self.imageContext = [CIContext contextWithOptions:nil];
}

- (void)setupFilterButton
{
	UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"+"
																  style:UIBarButtonItemStylePlain
																 target:self
																 action:@selector(addPressed)];
	self.navigationItem.rightBarButtonItem = barButton;

}

- (void)addPressed
{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Выберите фильтр" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
	
	[alert addAction: [UIAlertAction actionWithTitle:@"CIPhotoEffectTonal" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self chooseFilter:action];
	}]];
	
	[alert addAction: [UIAlertAction actionWithTitle:@"CIPhotoEffectTransfer" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self chooseFilter:action];
	}]];
	
	[alert addAction: [UIAlertAction actionWithTitle:@"CIPhotoEffectProcess" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self chooseFilter:action];
	}]];
	
	[alert addAction: [UIAlertAction actionWithTitle:@"CIPhotoEffectNoir" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self chooseFilter:action];
	}]];
	
	[alert addAction: [UIAlertAction actionWithTitle:@"CIColorMonochrome" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self chooseFilter:action];
	}]];
	
	[alert addAction: [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
	
	[self presentViewController:alert animated:YES completion:nil];
}

- (void)chooseFilter: (UIAlertAction *) action
{
	CIImage *image = [[CIImage alloc] initWithImage:self.currentImage];
	self.filter = [CIFilter filterWithName:action.title];
	
	[self.filter setValue:image forKey: kCIInputImageKey];
	
	[self changeFilter];
}

- (void)changeFilter
{
    CIImage *result = [self.filter valueForKey: @"outputImage"];
    CGImageRef cgImageRef = [self.imageContext createCGImage:result fromRect:[result extent]];
    UIImage *targetImage = [UIImage imageWithCGImage:cgImageRef];
    self.image.image = targetImage;
}


#pragma mark - LocalNotifications

- (void)sheduleLocalNotification
{
	UNMutableNotificationContent *content = [UNMutableNotificationContent new];
	content.title = @"Напоминание!";
	content.body = [NSString stringWithFormat:@"Вы давно не искали %@", [self.service getSearchString]];;
	content.sound = [UNNotificationSound defaultSound];
	
	// Смотрим разные варианты триггеров
	UNNotificationTrigger *whateverTrigger = [self intervalTrigger];
	
	// Создаем запрос на выполнение
	// Objective-C
	NSString *identifier = @"NotificationId";
	UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier
																		  content:content trigger:whateverTrigger];
	
	UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
	[center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error)
	 {
		 if (error)
		 {
			 NSLog(@"Чот пошло не так... %@",error);
		 }
	 }];
}

- (UNTimeIntervalNotificationTrigger *)intervalTrigger
{
	return [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:15 repeats:NO];
}


@end
