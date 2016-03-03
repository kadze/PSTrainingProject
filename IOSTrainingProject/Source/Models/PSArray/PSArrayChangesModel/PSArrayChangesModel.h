//
//  PSArrayChangesModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/1/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSArrayChangesModel : NSObject
@property (nonatomic, readonly) NSUInteger  changeType;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType;

@end
