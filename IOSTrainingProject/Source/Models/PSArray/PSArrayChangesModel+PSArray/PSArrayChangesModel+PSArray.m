//
//  PSArrayChangesModel+PSArray.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayChangesModel+PSArray.h"

@implementation PSArrayChangesModel (PSArray)

+ (instancetype)addModelWithIndex:(NSUInteger)index {
    return [PSArrayChangesModel modelWithChangeType:kPSArrayModelAddChanges index:index];
}

+ (instancetype)removeModelWithIndex:(NSUInteger)index {
    return [PSArrayChangesModel modelWithChangeType:kPSArrayModelRemoveChanges index:index];
}

+ (instancetype)insertModelWithIndex:(NSUInteger)index {
    return [PSArrayChangesModel modelWithChangeType:kPSArrayModelInsertChanges index:index];
}

+ (instancetype)replaceModelWithIndex:(NSUInteger)index {
    return [PSArrayChangesModel modelWithChangeType:kPSArrayModelReplaceChanges index:index];
}

+ (instancetype)exchangeModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [PSArrayChangesModel modelWithChangeType:kPSArrayModelExchangeChanges index:index toIndex:toIndex];
}

+ (instancetype)moveModelWithIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [PSArrayChangesModel modelWithChangeType:kPSArrayModelMoveChanges index:index toIndex:toIndex];
}

@end
