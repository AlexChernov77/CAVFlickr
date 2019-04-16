//
//  CAVSearchImagePresenterProtocol.h
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CAVSearchImagePresenterOutput <NSObject>

- (NSInteger)numberOfEntities;
- (id)entityAt: (NSInteger) index;
- (void)getData :(NSInteger) page andAmount: (NSInteger) amount andSearchString : (NSString *)searchSrting;
- (NSInteger)pageCount : (NSInteger) index;
- (void)clearData;
- (void)perfom: (NSInteger) index;

@end

