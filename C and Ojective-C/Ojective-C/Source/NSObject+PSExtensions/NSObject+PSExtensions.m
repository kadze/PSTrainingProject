//
//  NSObject+PSExtensions.m
//  PSTrainingProject
//
//  Created by Сергей on 28.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "NSObject+PSExtensions.h"

@implementation NSObject (PSExtensions)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index++) {
        [result addObject:[self object]];
    }
    
    return [[result copy] autorelease];
}

@end
