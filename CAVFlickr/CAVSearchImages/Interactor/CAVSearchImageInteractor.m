//
//  CAVSearchImageInteractor.m
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVSearchImageInteractor.h"
#import "DataLayer.h"

@interface CAVSearchImageInteractor()

@property (strong, nonatomic) DataLayer *dataLayer;

@end

@implementation CAVSearchImageInteractor

- (void)getImage:(NSInteger)page andAmount:(NSInteger)amount andSearchString:(NSString *)searchSrting andCompletion:(void (^)(NSArray *))completion {
    self.dataLayer = [[DataLayer alloc] initWithParametrs:page andAmount:amount :searchSrting];
    [self.dataLayer getImages:^(NSArray * _Nonnull urlArray) {
        completion(urlArray);
        [self.presenterOutput success];
    }];
}

@end
