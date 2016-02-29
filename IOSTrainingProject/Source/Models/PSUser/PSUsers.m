//
//  PSUsers.m
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUsers.h"

#import "PSUser.h"

#import "PSWeakifyMacros.h"

static const NSUInteger kPSUsersCount = 200;

@implementation PSUsers

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        [self fillWithUsers];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)fillWithUsers {
    PSWeakify(self);
    [self performBlockWithoutNotification:^{
        PSStrongify(self);
        for (NSUInteger index = 0; index < kPSUsersCount; index++) {
            [self addObject:[PSUser new]];
        }
    }];
}

@end
