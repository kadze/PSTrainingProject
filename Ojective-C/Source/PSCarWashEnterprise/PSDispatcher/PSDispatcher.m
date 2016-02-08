//
//  PSDispatcher.m
//  PSTrainingProject
//
//  Created by Сергей on 04.01.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSDispatcher.h"
#import "PSQueue.h"
#import "PSWorker.h"

@interface PSDispatcher ()
@property (nonatomic, retain)   PSQueue         *queue;
@property (nonatomic, retain)   NSMutableArray  *mutableHandlers;

- (void)processObject;

@end

@implementation PSDispatcher

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    self.mutableHandlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.queue = [PSQueue queue];
        self.mutableHandlers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(id)handler {
    @synchronized(handler) {
        [self.mutableHandlers addObject:handler];
        [handler addObserver:self];
    }
}

- (void)removeHandler:(id)handler {
    @synchronized(handler) {
        [handler removeObserver:self];
        [self.mutableHandlers removeObject:handler];
    }
}

- (void)performWorkWithObject:(id)object {
    [self.queue enqueueObject:object];
    [self processObject];
}

- (BOOL)containsHandler:(id)handler {
    return [self.mutableHandlers containsObject:handler];
}

#pragma mark -
#pragma mark Private

- (void)processObject {
    id object = [self.queue dequeueObject];
    if (object) {
        id handler = [self reserveHandler];
        if (handler) {
            [handler performWorkWithObject:object];
        } else {
            [self.queue enqueueObject:object];
        }
    }
}

- (id)reserveHandler {
    for (PSWorker *handler in self.mutableHandlers) {
        @synchronized(handler) {
            if (handler.state == kPSWorkerDidBecomeFree) {
                handler.state = kPSWorkerDidBecomeBusy;
                
                return handler;
            }
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)workerDidBecomeFree:(id)object {
    [self processObject];
}

@end
