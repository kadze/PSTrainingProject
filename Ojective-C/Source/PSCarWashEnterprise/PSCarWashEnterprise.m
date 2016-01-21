//
//  PSCarWash.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashEnterprise.h"
#import "PSAccountant.h"
#import "PSCar.h"
#import "PSDirector.h"
#import "PSMoneyProtocol.h"
#import "PSObservableObject.h"
#import "PSObserverProtocol.h"
#import "PSQueue.h"
#import "PSWasher.h"
#import "PSWorker.h"

const static NSUInteger kPSUpperBoundWashersCount = 50;

@interface PSCarWashEnterprise ()
@property (nonatomic, readwrite, retain)    NSMutableArray    *mutableWorkers;

- (void)hireWorker;
- (void)fireWorker;

- (void)addWorkers:(NSArray *)worker withObservers:(NSArray *)observers;
- (void)addWorker:(PSWorker *)worker withObservers:(NSArray *)observers;

- (id)freeWorkerOfClass:(Class)Class;

@end

@implementation PSCarWashEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableWorkers = nil;
    [self fireWorker];
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableWorkers = [NSMutableArray array];
        [self hireWorker];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)workers {
    return [[self.mutableWorkers copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)washCar:(PSCar *)car {
    PSWasher *washer = [self freeWorkerOfClass:[PSWorker class]];
    if (washer) {
        [washer performWorkWithObject:(id<PSMoneyProtocol>)car];
    }
}

#pragma mark -
#pragma mark Privat Methods

- (void)hireWorker {
    PSDirector *director = [PSDirector object];
    PSAccountant *accountant = [PSAccountant object];
    
    NSUInteger washersCount = arc4random_uniform(kPSUpperBoundWashersCount);
    [self addWorkers:[PSWasher objectsWithCount:washersCount] withObservers:@[accountant, self]];
    
    [self addWorker:accountant withObservers:@[self, director]];
    [self addWorker:director withObservers:nil];
}

- (void)addWorkers:(NSArray *)workers withObservers:(NSArray *)observers {
    for(PSWorker *worker in workers) {
        [self addWorker:worker withObservers:observers];
    }
}

- (void)addWorker:(PSWorker *)worker withObservers:(NSArray *)observers {
    for (id observer in observers) {
        [worker addObserver:observer];
    }
    [self.mutableWorkers addObject:worker];
}

- (void)fireWorker {
    id workers = self.mutableWorkers;
    for (PSWorker *worker in workers) {
        [self.mutableWorkers removeObject:worker];
    }
}

- (id)freeWorkerOfClass:(Class)Class {
    for (PSWorker *worker in self.mutableWorkers) {
        if ([worker isMemberOfClass:Class] && worker.state == kPSWorkerDidBecomeFree) {
            return worker;
        }
    }
    
    return nil;
}

@end
