//
//  SBFTimestampActionBlock.h
//  CAVFlickr
//
//  Created by Александр on 16.04.2019.
//  Copyright © 2019 Александр. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN

/**
 Блок действия с таймером создания
 */
@interface SBFTimestampActionBlock : NSObject

@property (nonatomic, readonly) NSTimeInterval delay; /**< Время задержки, после которой считается что блок можно выполнять */
@property (nonatomic, readonly) dispatch_block_t actionBlock; /** Блок действия */

/**
 Конструктор с блоком
 @param actionBlock блок действия
 @return QCKSearchActionBlock
 */
- (instancetype)initWithActionBlock:(dispatch_block_t)actionBlock;

/**
 Конструктор с блоком и временем задержки
 @param delay задержка, после которой считается что блок можно выполнять
 @param actionBlock блок действия
 @return QCKSearchActionBlock
 */
- (instancetype)initWithDelay:(NSTimeInterval)delay actionBlock:(dispatch_block_t)actionBlock NS_DESIGNATED_INITIALIZER;

/** Запрет дефолтных конструкторов */
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 Метод проверяет, что блок можно выполнять, так как прошло время задержки с момента создания объекта
 @param currentDate текущее время
 @return YES - если, время создания обекта + задержка превысили currentDate
 */
- (BOOL)isAllowedToExecuteForDate:(NSDate *)currentDate;

@end

NS_ASSUME_NONNULL_END
