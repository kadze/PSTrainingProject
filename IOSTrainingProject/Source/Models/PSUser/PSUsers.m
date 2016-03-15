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

static const NSUInteger kPSUsersCount = 15;

@interface PSUsers ()

- (void)saveNotification:(NSNotification *)notification;
- (void)fillWithUsers;

@end

@implementation PSUsers

@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.filePath];
}

#pragma mark -
#pragma mark Private

- (void)saveNotification:(NSNotification *)notification {
    [self save];
}

- (void)fillWithUsers {
    PSWeakify(self);
    [self performBlockWithoutNotification:^{
        PSStrongify(self);
        for (NSUInteger index = 0; index < kPSUsersCount; index++) {
            [self addObject:[PSUser new]];
        }
    }];
}

- (void)performLoading {
    sleep(3);
    [self fillWithUsers];

    @synchronized(self) {
        self.state = kPSModelDidLoad;
    }
}

@end
