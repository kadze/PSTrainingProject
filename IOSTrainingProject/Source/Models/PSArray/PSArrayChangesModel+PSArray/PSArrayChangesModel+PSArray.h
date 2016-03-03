//
//  PSArrayChangesModel+PSArray.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayChangesModel.h"

@interface PSArrayChangesModel (PSArray)

+ (instancetype)addModelWithIndex:(NSUInteger)fromIndex;
+ (instancetype)insertModelWithIndex:(NSUInteger)fromIndex;
+ (instancetype)removeModelWithIndex:(NSUInteger)fromIndex;
+ (instancetype)replaceModelWithIndex:(NSUInteger)fromIndex;

+ (instancetype)exchangeModelWithIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
+ (instancetype)moveModelWithIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
