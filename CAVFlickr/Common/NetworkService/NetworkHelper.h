//
//  NetworkHelper.h
//  CAVFlickr
//
//  Created by Александр on 12/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject

+ (NSURL *)URLForSearchString:(NSString *)searchString : (NSInteger) page andAmount: (NSInteger) amount;

@end
