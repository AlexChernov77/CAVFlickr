//
//  NetworkService.h
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkService : NSObject

- (void)findFlickrPhotoWithSearchString:(NSString *)searchSrting : (NSInteger) page andAmount: (NSInteger) amount : (void (^) (NSDictionary *data)) success andFailure : (void (^) (NSInteger code)) failure;

@end
