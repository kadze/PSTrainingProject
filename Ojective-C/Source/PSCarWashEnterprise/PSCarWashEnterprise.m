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
#import "PSObserverProtocol.h"
#import "PSWasher.h"
#import "PSWorker.h"

const static NSUInteger kPSWashersCount = 2;

@interface PSCarWashEnterprise ()
@property (nonatomic, retain)    NSMutableArray  *mutableWorkers;
@property (nonatomic, retain)    PSQueue         *cars;

- (void)hireWorker;
- (void)fireWorker;

- (void)addWorkers:(NSArray *)worker withObservers:(NSArray *)observers;
- (void)addWorker:(PSWorker *)worker withObservers:(NSArray *)observers;

- (id)freeWorkerOfClass:(Class)class;

@end

@implementation PSCarWashEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self fireWorker];
    
    self.mutableWorkers = nil;
    self.cars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableWorkers = [NSMutableArray array];
        self.cars = [PSQueue queue];
        
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
    PSWasher *washer = [self freeWorkerOfClass:[PSWasher class]];
    if (washer) {
        [washer performWorkWithObject:car];
    }
}

- (void)washCars:(NSArray *)cars {
    PSQueue *carsQueue = self.cars;
    
    for (PSCar *car in cars) {
        [carsQueue enqueueObject:car];
    }
    
    while (!carsQueue.isEmpty) {
        [self washCar:[carsQueue dequeueObject]];
    }
}

#pragma mark -
#pragma mark Privat Methods

- (void)hireWorker {
    PSDirector *director = [PSDirector object];
    PSAccountant *accountant = [PSAccountant object];
    
    [self addWorkers:[PSWasher objectsWithCount:kPSWashersCount] withObservers:@[self, accountant]];
    
    [self addWorker:accountant withObservers:@[self, director]];
    [self addWorker:director withObservers:nil];
}

- (void)addWorkers:(NSArray *)workers withObservers:(NSArray *)observers {
    for (PSWorker *worker in workers) {
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
        [worker removeObserver:self];
    }
    [workers removeAllObjects];
}

- (id)freeWorkerOfClass:(Class)class {
    for (PSWorker *worker in self.mutableWorkers) {
        if (worker.state == kPSWorkerDidBecomeFree && [worker isMemberOfClass:class]) {
            return worker;
        }
    }
    
    return nil;
}

@end
