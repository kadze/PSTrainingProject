//
//  PSArrayChangesModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/1/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PSArrayModelChangeTypes) {
    kPSArrayModelAddChanges,
    kPSArrayModelInsertChanges,
    kPSArrayModelRemoveChanges,
    kPSArrayModelReplaceChanges,
    kPSArrayModelExchangeChanges,
    kPSArrayModelMoveChanges
};

@interface PSArrayChangesModel : NSObject
@property (nonatomic, readonly) NSUInteger  changeType;
@property (nonatomic, readonly) NSUInteger  index;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType;
+ (instancetype)modelWithChangeType:(NSUInteger)changeType index:(NSUInteger)index;
+ (instancetype)modelWithChangeType:(NSUInteger)changeType index:(NSUInteger)fromIndex toIndex:(NSUInteger)index;

@end
