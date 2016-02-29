//
//  UINib+PSExtensions.m
//  IOSTrainingProject
//
//  Created by Сергей on 2/29/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "UINib+PSExtensions.h"

@implementation UINib (PSExtensions)

#pragma mark -
#pragma mark Class methods

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner {
    return [[self nibWithClass:cls] objectWithClass:cls owner:owner];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner {
    NSArray *array = [self objectsWithOwner:owner];
    
    for (id object in array) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

- (NSArray *)objects {
    return [self objectsWithOwner:nil];
}

- (NSArray *)objectsWithOwner:(id)ownerOrNil {
    return [self instantiateWithOwner:ownerOrNil options:nil];
}

@end
