//
//  PSArrayIndexChangesModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayChangesModel.h"

typedef NS_ENUM(NSUInteger, PSArrayIndexModelChangeTypes) {
    kPSArrayModelAddChanges,
    kPSArrayModelInsertChanges,
    kPSArrayModelRemoveChanges,
    kPSArrayModelReplaceChanges,
};

@interface PSArrayIndexChangesModel : PSArrayChangesModel
@property (nonatomic, readonly) NSUInteger  fromIndex;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType fromIndex:(NSUInteger)fromIndex;

@end
