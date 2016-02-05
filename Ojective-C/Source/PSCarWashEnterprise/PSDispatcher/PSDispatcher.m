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
@property (nonatomic, retain)   PSQueue         *processingObjects;
@property (nonatomic, retain)   NSMutableArray  *mutableHandlers;

- (void)processTheObject:(id)object withHandler:(PSWorker *)handler;

@end

@implementation PSDispatcher

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.processingObjects = nil;
    self.mutableHandlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.processingObjects = [PSQueue queue];
        self.mutableHandlers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addProcessingObject:(id)object {
    PSWorker *freeHandler = [self.mutableHandlers firstObject];
    
    @synchronized(freeHandler) {
        if (nil != freeHandler && kPSWorkerDidBecomeFree == freeHandler.state) {
            [self processTheObject:object withHandler:freeHandler];
        } else {
            [self.processingObjects enqueueObject:object];
        }
    }
}

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

#pragma mark -
#pragma mark Private

- (void)processTheObject:(id)object withHandler:(PSWorker *)handler {
    @synchronized(handler) {
        if (kPSWorkerDidBecomeFree == handler.state) {
            [handler performWorkWithObject:object];
        }
    }
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)PSWorkerDidBecomeFree:(id)worker {
    PSQueue *processingObjects = self.processingObjects;
    
    if (![processingObjects isEmpty]) {
        [self processTheObject:[processingObjects dequeueObject] withHandler:worker];
    }
}

@end
