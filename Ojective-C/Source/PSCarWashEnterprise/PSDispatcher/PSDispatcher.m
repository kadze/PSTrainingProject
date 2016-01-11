//
//  PSDispatcher.m
//  PSTrainingProject
//
//  Created by Сергей on 04.01.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSDispatcher.h"
#import "PSQueue.h"

@interface PSDispatcher ()
@property (nonatomic, retain)   PSQueue     *processingObjects;
@property (nonatomic, retain)   PSWorkers   *mutableHandlers;

- (void)processTheObject:(id)object withHandler:(PSWorkers *)handler;

@end

@implementation PSDispatcher

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    //todo remove the observations
    self.processingObjects = nil;
    self.mutableHandlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.processingObjects = [PSQueue queue];
        self.mutableHandlers = [PSWorkers pool];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementations

- (void)addProcessingObject:(id)object {
    PSWorkers *freeHandler = [self.mutableHandlers freeWorker];
    
    @synchronized(freeHandler) {
        if (nil != freeHandler && kPSWorkerFree == freeHandler.state) {
            [self processTheObject:object withHandler:freeHandler];
        } else {
            [self.processingObjects enqueueObject:object];
        }
    }
}

- (void)addHandler:(PSWorkers *)handler {
    @synchronized(handler) {
        [self.mutableHandlers addWorker:handler];
        [handler addObserver:self];
    }
}

- (void)removeHandler:(PSWorkers *)handler {
    @synchronized(handler) {
        if (kPSWorkerFree == handler.state) {
            [handler removeObserver:self];
            [self.mutableHandlers removeWorker:handler];
        }
    }
}

#pragma mark -
#pragma mark Private Implementations

- (void)processTheObject:(id)object withHandler:(PSWorkers *)handler {
    @synchronized(handler) {
        if (kPSWorkerFree == handler.state) {
            [handler performWorkWithObject:object];
        }
    }
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)PSWorkerFree:(PSWorkers *)workers {
    PSQueue *processingObjects = self.processingObjects;
    
    if (![processingObjects isEmpty]) {
        [self processTheObject:[processingObjects dequeueObject] withHandler:workers];
    }
}

@end
