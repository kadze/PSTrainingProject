//
//  PSWorker.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWorker.h"
#import "PSQueue.h"

@interface PSWorker ()
@property (nonatomic, retain)   PSQueue *queue;

- (void)workWithObject:(id)object;
- (void)performWorkWithObjectOnMainThread:(id)object;

@end

@implementation PSWorker
@synthesize money = _money;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)worker {
    return [[[self alloc] initWithSalary:0 experience:0] autorelease];
}

+ (instancetype)workerWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    return [[[self alloc] initWithSalary:salary experience:experience] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.state = kPSWorkerDidBecomeFree;
        self.queue = [PSQueue object];
    }
    
    return self;
}

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    self = [self init];
    
    if (self) {
        self.salary = salary;
        self.experience = experience;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Method

- (void)performWorkWithObject:(id<PSMoneyProtocol>)object {
    @synchronized(self) {
        [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:) withObject:object];
    }
}

- (void)performWorkWithObjectInBackground:(id)object {
    [self workWithObject:object];
    [self performSelectorOnMainThread:@selector(performWorkWithObjectOnMainThread:) withObject:object waitUntilDone:NO];
}

#pragma mark -
#pragma mark Private Methods

- (void)workWithObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkWithObjectOnMainThread:(id)object {
    [self finishPerformWork:object];
    @synchronized(self) {
        [self finishProcessing];
    }
}

- (void)finishProcessing {
    self.state = kPSWorkerDidPerformWorkWithObject;
}

- (void)finishPerformWork:(PSWorker *)object {
    @synchronized(object) {
        object.state = kPSWorkerDidBecomeFree;
    }
}

#pragma mark -
#pragma mark PSObsevableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kPSWorkerDidBecomeFree:
            return @selector(workerDidBecomeFree:);
            
        case kPSWorkerDidBecomeBusy:
            return @selector(workerDidBecomeBusy:);
            
        case kPSWorkerDidPerformWorkWithObject:
            return @selector(workerDidPerformWorkWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Money Protocol

- (void)takeMoney:(NSUInteger)money {
    @synchronized(self) {
        self.money += money;
    }
}

- (void)giveMoney:(NSUInteger)money {
    @synchronized(self) {
        self.money -= money;
    }
}

- (void)takeMoney:(NSUInteger)money fromMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    @synchronized(self) {
        [self takeMoney:money];
        [moneyKeeper giveMoney:money];
    }
}

- (void)giveMoney:(NSUInteger)money toMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    @synchronized(self) {
        [self giveMoney:money];
        [moneyKeeper takeMoney:money];
    }
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)workerDidPerformWorkWithObject:(id)object {
    [self performWorkWithObject:object];
}

@end
