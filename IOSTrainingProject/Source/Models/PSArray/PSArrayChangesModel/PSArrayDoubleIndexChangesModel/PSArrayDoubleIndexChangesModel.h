//
//  PSArrayDoubleIndexChangesModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayIndexChangesModel.h"

typedef NS_ENUM(NSUInteger, PSArrayDoubleIndexModelChangeTypes) {
    kPSArrayModelExchangeChanges,
    kPSArrayModelMoveChanges
};

@interface PSArrayDoubleIndexChangesModel : PSArrayIndexChangesModel
@property (nonatomic, readonly) NSUInteger  toIndex;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType fromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
