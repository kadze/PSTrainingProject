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
@property (nonatomic, retain)   PSQueue *workersQueue;

- (void)workWithObject:(id)object;
- (void)performWorkWithObjectOnMainThread:(id)object;

- (void)finishProcessing;
- (void)finishPerformWork:(PSWorker *)object;

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

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    self = [super init];
    
    if (self) {
        self.salary = salary;
        self.experience = experience;
        self.state = kPSWorkerDidBecomeFree;
        self.workersQueue = [PSQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Method

- (void)performWorkWithObject:(id<PSMoneyProtocol>)object {
    @synchronized(self) {
        if (self.state == kPSWorkerDidBecomeFree) {
            self.state = kPSWorkerDidBecomeBusy;
            [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:) withObject:object];
        } else {
            [self.workersQueue enqueueObject:object];
        }
    }
}

- (void)performWorkWithObjectInBackground:(id<PSMoneyProtocol>)object {
    [self workWithObject:object];
    [self performSelectorOnMainThread:@selector(performWorkWithObjectOnMainThread:) withObject:object waitUntilDone:NO];
}

#pragma mark -
#pragma mark Private Methods

- (void)workWithObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkWithObjectOnMainThread:(id)object {
    @synchronized(self) {
        id object = [self.workersQueue dequeueObject];
        if (object) {
            [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:) withObject:object];
        } else {
            [self finishProcessing];
            [self finishPerformWork:object];
        }
    }
}

- (void)finishProcessing {
    self.state = kPSWorkerDidPerformWorkWithObject;
}

- (void)finishPerformWork:(PSWorker *)object {
    object.state = kPSWorkerDidBecomeFree;
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

- (void)workerDidPerformWorkWithObject:(id)worker {
    [self performWorkWithObject:worker];
}

@end
