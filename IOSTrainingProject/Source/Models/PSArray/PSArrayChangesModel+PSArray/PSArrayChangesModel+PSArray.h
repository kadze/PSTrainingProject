//
//  PSArrayChangesModel+PSArray.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayChangesModel.h"

@interface PSArrayChangesModel (PSArray)

+ (instancetype)addModelWithIndex:(NSUInteger)index;
+ (instancetype)insertModelWithIndex:(NSUInteger)index;
+ (instancetype)removeModelWithIndex:(NSUInteger)index;
+ (instancetype)replaceModelWithIndex:(NSUInteger)index;

+ (instancetype)exchangeModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;
+ (instancetype)moveModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;

@end
