//
//  DataLayer.m
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "DataLayer.h"
#import "NetworkService.h"
#import "ImagesModel.h"

@interface DataLayer()

@property (strong, nonatomic) NetworkService *service;
@property (assign, nonatomic) NSInteger amount;
@property (assign, nonatomic) NSInteger page;
@property (strong, nonatomic) NSString *searchSrting;

@end

@implementation DataLayer

- (instancetype)initWithParametrs : (NSInteger) page andAmount: (NSInteger) amount : (NSString *)searchSrting 
{
    if ( self = [super init])
    {
        _page = page;
        _amount = amount;
        _service = [NetworkService new];
        _searchSrting = searchSrting;
    }
    return self;
}

- (void)getImages: (void (^) (NSArray *urlArray)) completion
{
    [self.service findFlickrPhotoWithSearchString:self.searchSrting :self.page andAmount:self.amount :^(NSDictionary *data) {
        NSMutableArray *urlArray = [NSMutableArray new];
        
        NSDictionary *photoDictionary = data[@"photos"];
        NSDictionary *photos = photoDictionary[@"photo"];

        NSInteger pageCount = [photoDictionary[@"pages"] integerValue];
        
        for (NSDictionary *imageJSON in photos)
        {
            NSString *url_sq = imageJSON[@"url_m"];
            NSString *url_m = imageJSON[@"url_sq"];
            
            ImagesModel *model = [[ImagesModel alloc] initWithImageURL:url_m withLargeImageURL:url_sq andpageCount:pageCount];
            
            [urlArray addObject:model];
        }
        
        completion(urlArray);
        
    } andFailure:^(NSInteger code) {
        NSLog(@"Обработка ошибки");
    }];
}

@end
