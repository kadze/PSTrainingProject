//
//  PSArrayChangesModel+PSArray.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayChangesModel+PSArray.h"

#import "PSArrayIndexChangesModel.h"
#import "PSArrayDoubleIndexChangesModel.h"

@implementation PSArrayChangesModel (PSArray)

+ (instancetype)addModelWithIndex:(NSUInteger)fromIndex {
    return [PSArrayIndexChangesModel modelWithChangeType:kPSArrayModelAddChanges fromIndex:fromIndex];
}

+ (instancetype)removeModelWithIndex:(NSUInteger)fromIndex {
    return [PSArrayIndexChangesModel modelWithChangeType:kPSArrayModelRemoveChanges fromIndex:fromIndex];
}

+ (instancetype)insertModelWithIndex:(NSUInteger)fromIndex {
    return [PSArrayIndexChangesModel modelWithChangeType:kPSArrayModelInsertChanges fromIndex:fromIndex];
}

+ (instancetype)replaceModelWithIndex:(NSUInteger)fromIndex {
    return [PSArrayIndexChangesModel modelWithChangeType:kPSArrayModelReplaceChanges fromIndex:fromIndex];
}

+ (instancetype)exchangeModelWithIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    return [PSArrayDoubleIndexChangesModel modelWithChangeType:kPSArrayModelExchangeChanges fromIndex:fromIndex toIndex:toIndex];
}

+ (instancetype)moveModelWithIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    return [PSArrayDoubleIndexChangesModel modelWithChangeType:kPSArrayModelMoveChanges fromIndex:fromIndex toIndex:toIndex];
}

@end
