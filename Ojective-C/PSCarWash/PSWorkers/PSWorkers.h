//
//  PSWorkers.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSWorkers : NSObject

@property (nonatomic, readonly, copy)   NSString    *name;
@property (nonatomic, readonly)         NSString    *position;
@property (nonatomic, readonly)         NSSet       *value;

+ (instancetype)workesWithName:(NSString *)name;

@end
