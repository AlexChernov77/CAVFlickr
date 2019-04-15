//
//  CAVSearchImagesInteractorProtocol.h
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CAVSearchImagesInteractorInput <NSObject>

- (void)getImage:(NSInteger) page andAmount: (NSInteger) amount andSearchString : (NSString *) searchSrting andCompletion: (void (^) (NSArray *urlArray)) completion;

@end

@protocol CAVSearchImagesInteractorOutput <NSObject>

- (void)success;
- (void)failure: (NSInteger) error;

@end
