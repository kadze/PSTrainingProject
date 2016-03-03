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

@end

@implementation PSArrayChangesModel

+ (instancetype)modelWithChangeType:(NSUInteger)changeType {
    PSArrayChangesModel *object = [self new];
    object.changeType = changeType;
    
    return object;
}

@end
