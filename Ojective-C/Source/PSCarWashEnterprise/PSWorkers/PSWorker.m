//
//  PSWorker.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWorker.h"

@interface PSWorker ()

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
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)workWithObject:(id)object {
     [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkWithObject:(id<PSMoneyProtocol>)object {
    self.state = kPSWorkerDidBecomeBusy;
    [self workWithObject:object];
    [self finishProcessing];
    [self finishPerformWork];
}

- (void)finishProcessing {
    self.state = kPSWorkerDidPerformWorkWithObject;
}

- (void)finishPerformWork {
    self.state = kPSWorkerDidBecomeFree;
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
    self.money += money;
}

- (void)giveMoney:(NSUInteger)money {
    self.money -= money;
}

- (void)takeMoney:(NSUInteger)money fromMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    [self takeMoney:money];
    [moneyKeeper giveMoney:money];
}

- (void)giveMoney:(NSUInteger)money toMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    [self giveMoney:money];
    [moneyKeeper takeMoney:money];
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)workerDidPerformWorkWithObject:(id)worker {
    [self performWorkWithObject:worker];
}

@end
