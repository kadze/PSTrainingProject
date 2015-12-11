//
//  PSWorkers.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWorkers.h"

@interface PSWorkers ()

@property (nonatomic, readwrite, copy)  NSString        *name;
@property (nonatomic, readwrite, copy)  NSString        *position;
@property (nonatomic, readwrite)        NSMutableSet    *mutableValue;

@end

@implementation PSWorkers

+ (instancetype)workesWithName:(NSString *)name {
    return [[[self alloc] initWithName:name] autorelease];
}

@end
