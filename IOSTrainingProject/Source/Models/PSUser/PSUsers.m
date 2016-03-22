//
//  PSUsers.m
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUsers.h"

#import "PSUser.h"

#include "NSFileManager+PSExtensions.h"

#import "PSWeakifyMacros.h"

static const NSUInteger kPSUsersCount = 5;

static NSString * const kPSFileName = @"users.plist";

@interface PSUsers ()

- (void)saveNotification:(NSNotification *)notification;
- (void)fillWithUsers;

@end

@implementation PSUsers

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self stopObserving];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self startObserving];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (NSString *)fileName {
    return kPSFileName;
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentPath];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
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
    NSArray *objects = nil;
    if (self.cached) {
        objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    }
    
    [self fillWithUsers];

    @synchronized(self) {
        self.state = kPSModelDidLoad;
    }
}

- (void)startObserving {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(saveNotification:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
}

- (void)stopObserving {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
