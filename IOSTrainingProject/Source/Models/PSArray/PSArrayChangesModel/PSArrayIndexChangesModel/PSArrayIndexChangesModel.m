//
//  PSArrayIndexChangesModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayIndexChangesModel.h"

@interface PSArrayIndexChangesModel ()
@property (nonatomic, assign)   NSUInteger  fromIndex;

@end

@implementation PSArrayIndexChangesModel

+ (instancetype)modelWithChangeType:(NSUInteger)changeType fromIndex:(NSUInteger)fromIndex {
    PSArrayIndexChangesModel *object = [super modelWithChangeType:changeType];
    object.fromIndex = fromIndex;
    
    return object;
}

@end
