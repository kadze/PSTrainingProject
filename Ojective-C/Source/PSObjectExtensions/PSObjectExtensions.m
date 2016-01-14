//
//  PSObjectExtensions.m
//  PSTrainingProject
//
//  Created by Сергей on 28.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSObjectExtensions.h"

@implementation NSObject (PSObjectExtensions)

+ (id)object {
    return [[[self alloc] init] autorelease];
}

@end
