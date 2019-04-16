//
//  SBFTimestampActionBlock.m
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "SBFTimestampActionBlock.h"


@interface SBFTimestampActionBlock()

@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, strong) NSDate *creationTime;
@property (nonatomic, copy) dispatch_block_t actionBlock;

@end


@implementation SBFTimestampActionBlock

- (instancetype)initWithDelay:(NSTimeInterval)delay actionBlock:(dispatch_block_t)actionBlock
{
	self = [super init];
	if (self)
	{
		_delay = delay;
		_creationTime = [NSDate date];
		_actionBlock = [actionBlock copy];
	}
	return self;
}

- (instancetype)initWithActionBlock:(dispatch_block_t)actionBlock
{
	const NSTimeInterval defaultDelay = 0.3;
	return [self initWithDelay:defaultDelay actionBlock:actionBlock];
}


#pragma mark - Public

- (BOOL)isAllowedToExecuteForDate:(NSDate *)currentDate
{
	return (self.creationTime.timeIntervalSince1970 + self.delay) > currentDate.timeIntervalSince1970;
}

@end
