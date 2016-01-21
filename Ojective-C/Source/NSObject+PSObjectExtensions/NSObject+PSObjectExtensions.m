//
//  PSObjectExtensions.m
//  PSTrainingProject
//
//  Created by Сергей on 28.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "NSObject+PSObjectExtensions.h"

@implementation NSObject (PSObjectExtensions)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index; index < count; index++) {
        [result addObject:[self object]];
    }
    
    return [[result copy] autorelease];
}

@end
