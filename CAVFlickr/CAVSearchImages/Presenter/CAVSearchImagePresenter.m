//
//  CAVSearchImagePresenter.m
//  CAVFlickr
//
//  Created by Александр on 15/04/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CAVSearchImagePresenter.h"
#import "CAVSearchImagesInteractorProtocol.h"
#import "ImagesModel.h"

@interface CAVSearchImagePresenter() <CAVSearchImagesInteractorOutput>

@property (strong, nonatomic) NSArray* dataSource;

@end


@implementation CAVSearchImagePresenter



#pragma mark - CAVSearchImagesInteractorOutput

-(instancetype)init
{
    if ( self = [super init])
    {
        _dataSource = [NSArray new];
    }
    return self;
}

- (void)failure:(NSInteger)error
{
    
}

- (void)success
{
    [self.viewOutput reloadData];
}


#pragma mark - CAVSearchImagePresenterOutput

- (id)entityAt:(NSInteger)index
{
    if ([self.dataSource count] - 1 < index)
    {
        return nil;
    }
    else
    {
        return self.dataSource[index];
    }
}

- (void)getData :(NSInteger) page andAmount: (NSInteger) amount andSearchString : (NSString *)searchSrting
{
    [self.interaptorInput getImage:page andAmount:amount andSearchString:searchSrting andCompletion:^(NSArray *urlArray) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *array = [NSMutableArray arrayWithArray:self.dataSource];
            [array addObjectsFromArray:urlArray];
            self.dataSource = array;
            
            [self.viewOutput reloadData];
        });
    }];
}

- (NSInteger)numberOfEntities
{
    return [self.dataSource count];
}

- (NSInteger)pageCount : (NSInteger) index
{
    ImagesModel *model = self.dataSource[index];
    return model.pageCount;
}

- (void)clearData
{
    self.dataSource = @[];
}

- (void)perfom : (NSInteger) index
{
	ImagesModel *model = self.dataSource[index];
	[self.routerDelegate showDetail: model];
}




@end
