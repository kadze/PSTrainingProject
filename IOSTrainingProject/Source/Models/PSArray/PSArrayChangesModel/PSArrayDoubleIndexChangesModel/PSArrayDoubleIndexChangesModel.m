//
//  PSArrayDoubleIndexChangesModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayDoubleIndexChangesModel.h"

@interface PSArrayDoubleIndexChangesModel ()
@property (nonatomic, assign)   NSUInteger  toIndex;

@end

@implementation PSArrayDoubleIndexChangesModel

+ (instancetype)modelWithChangeType:(NSUInteger)changeType fromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    PSArrayDoubleIndexChangesModel *object = [super modelWithChangeType:changeType fromIndex:fromIndex];
    object.toIndex = toIndex;
    
    return object;
}

@end
