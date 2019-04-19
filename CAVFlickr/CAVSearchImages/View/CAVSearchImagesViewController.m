//
//  CAVSearchImagesViewController.m
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVSearchImagesViewController.h"
#import "CAVImageSearchCollectionViewCell.h"
#import "DataLayer.h"
#import "ImagesModel.h"
#import "CAVSearchImagesRouter.h"
#import "SBFTimestampActionBlock.h"
#import "CAVNSUserdefaultService.h"
@import UserNotifications;

@interface CAVSearchImagesViewController () <UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (assign, nonatomic) NSInteger pageCount;
@property (nonatomic, strong) SBFTimestampActionBlock *searchAction;
@property (nonatomic, strong) CAVNSUserdefaultService *service;

@end


@implementation CAVSearchImagesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.service =  [CAVNSUserdefaultService new];
    [self setupSearchBar];
    [self setupCollectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear: animated];
	self.searchBar.text = [self.service getSearchString];
	[self.presenterOutput getData:self.pageCount andAmount:20 andSearchString:self.searchBar.text];
	[self.collectionView reloadData];
}

#pragma mark - Setup & Layouts

- (void)setupCollectionView
{
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:[self collectionViewLayout]];
    self.collectionView.backgroundColor = UIColor.grayColor;
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CAVImageSearchCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CAVImageSearchCollectionViewCell class])];
}

- (void)setupSearchBar
{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.placeholder = @"Введите название картинки";
    self.searchBar.translucent = NO;
    [self.searchBar setValue:@"Отмена" forKey:@"_cancelButtonText"];
    [self.searchBar sizeToFit];
    self.navigationItem.titleView = self.searchBar;
    [self.searchBar.heightAnchor constraintEqualToConstant:44].active = YES;
    self.searchBar.delegate = self;
}


- (UICollectionViewFlowLayout *)collectionViewLayout
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self.pageCount = 1;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake((CGRectGetWidth(self.view.frame) - 30.0) / 2, (CGRectGetWidth(self.view.frame) - 30.0) / 2);
    
    return layout;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.presenterOutput numberOfEntities];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CAVImageSearchCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CAVImageSearchCollectionViewCell class]) forIndexPath:indexPath];
    
    ImagesModel *model = [self.presenterOutput entityAt:indexPath.row];
    
    [cell bind:model];
    
    return cell;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.presenterOutput numberOfEntities] - 1)
    {
        if (self.pageCount != [self.presenterOutput pageCount:indexPath.row])
        {
            self.pageCount++;
        }
        [self.presenterOutput getData:self.pageCount andAmount:20 andSearchString:self.searchBar.text];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	[self.presenterOutput perfom: indexPath.row];
}


#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.searchBar.text = @"";
    [self.searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[self cancelSearchAction];
	
    [self.presenterOutput clearData];
    [self.collectionView reloadData];

	dispatch_block_t searchBlock = dispatch_block_create(0, ^{
		[self.presenterOutput getData:self.pageCount andAmount:20 andSearchString:searchText];
	});
	
	SBFTimestampActionBlock *searchAction = [[SBFTimestampActionBlock alloc] initWithDelay:1 actionBlock:searchBlock];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(searchAction.delay * NSEC_PER_SEC)),
				   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
				   searchAction.actionBlock);
	
	self.searchAction = searchAction;
}

- (void)cancelSearchAction
{
	if (self.searchAction.actionBlock)
	{
		dispatch_block_cancel(self.searchAction.actionBlock);
	}
	self.searchAction = nil;
}


#pragma mark - CAVSearchImagesViewProtocol

- (void)reloadData
{
    [self.collectionView reloadData];
}

#pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
	   willPresentNotification:(UNNotification *)notification
		 withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
	
	
	[self.service saveSearcString:self.searchBar.text];
	
	if (completionHandler)
	{
		completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
	}
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
		 withCompletionHandler:(void(^)(void))completionHandler
{
	UNNotificationContent *content = response.notification.request.content;
	
		[self.service saveSearcString:self.searchBar.text];
	
	if (completionHandler)
	{
		completionHandler();
	}
}


@end
