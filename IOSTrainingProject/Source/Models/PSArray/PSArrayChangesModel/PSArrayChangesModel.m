//
//  PSArrayChangesModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/1/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayChangesModel.h"

@interface PSArrayChangesModel ()
@property (nonatomic, assign)   NSUInteger  changeType;
@property (nonatomic, assign)   NSUInteger  index;

@end

@implementation PSArrayChangesModel

+ (instancetype)modelWithChangeType:(NSUInteger)changeType {
    PSArrayChangesModel *object = [self new];
    object.changeType = changeType;
    
    return object;
}

+ (instancetype)modelWithChangeType:(NSUInteger)changeType index:(NSUInteger)index {
    PSArrayChangesModel *object = [self modelWithChangeType:changeType];
    object.index = index;
    
    return object;
}

+ (instancetype)modelWithChangeType:(NSUInteger)changeType index:(NSUInteger)fromIndex toIndex:(NSUInteger)index {
    PSArrayChangesModel *object = [self modelWithChangeType:changeType index:fromIndex];
    object.index = index;
    
    return object;
}

@end
