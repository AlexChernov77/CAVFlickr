//
//  CAVNSUserdefaultService.h
//  CAVFlickr
//
//  Created by Александр on 19.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAVNSUserdefaultService : NSObject

-(void)saveSearcString: (NSString *) searchString;
-(NSString *)getSearchString;

@end

NS_ASSUME_NONNULL_END
