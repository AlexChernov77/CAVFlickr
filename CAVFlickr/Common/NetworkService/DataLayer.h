//
//  DataLayer.h
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataLayer : NSObject

- (instancetype)initWithParametrs : (NSInteger) page andAmount: (NSInteger) amount : (NSString *)searchSrting;
- (void)getImages: (void (^) (NSArray *urlArray)) completion;

@end

NS_ASSUME_NONNULL_END
