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
#import "PSDispatcher.h"
#import "PSMoneyProtocol.h"
#import "PSObserverProtocol.h"
#import "PSWasher.h"
#import "PSWorker.h"

const static NSUInteger kPSWashersCount = 50;
const static NSUInteger kPSAccountantsCount = 10;
const static NSUInteger kPSDirectorsCount = 1;

@interface PSCarWashEnterprise ()
@property (nonatomic, retain)   NSMutableArray  *mutableWorkers;
@property (nonatomic, retain)   PSQueue         *cars;
@property (nonatomic, retain)   PSDispatcher    *washersDispatcher;
@property (nonatomic, retain)   PSDispatcher    *accountantsDispatcher;
@property (nonatomic, retain)   PSDispatcher    *directorsDispatcher;

- (void)hireWorker;
- (void)fireWorker;

- (void)addWorkers:(NSArray *)worker withDispatcher:(PSDispatcher *)dispatcher;

@end

@implementation PSCarWashEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self fireWorker];
    
    self.mutableWorkers = nil;
    self.cars = nil;
    self.washersDispatcher = nil;
    self.accountantsDispatcher = nil;
    self.directorsDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableWorkers = [NSMutableArray array];
        self.cars = [PSQueue queue];
        self.washersDispatcher = [PSDispatcher object];
        self.accountantsDispatcher = [PSDispatcher object];
        self.directorsDispatcher = [PSDispatcher object];
        
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

- (void)washCars:(NSArray *)cars {
    for (PSCar *car in cars) {
        [self.washersDispatcher performWorkWithObject:car];
    }
}

#pragma mark -
#pragma mark Privat Methods

- (void)hireWorker {
    NSArray *directors = [PSDirector objectsWithCount:kPSDirectorsCount];
    NSArray *accountants = [PSAccountant objectsWithCount:kPSAccountantsCount];
    NSArray *washers = [PSWasher objectsWithCount:kPSWashersCount];
    
    [self addWorkers:washers withDispatcher:self.washersDispatcher];
    [self addWorkers:accountants withDispatcher:self.accountantsDispatcher];
    [self addWorkers:directors withDispatcher:self.directorsDispatcher];
}

- (void)addWorkers:(NSArray *)workers withDispatcher:(PSDispatcher *)dispatcher {
    for (PSWorker *worker in workers) {
        [dispatcher addHandler:worker];
        [self.mutableWorkers addObject:worker];
        [worker addObserver:self];
    }
}

- (void)fireWorker {
    id workers = self.mutableWorkers;
    for (PSWorker *worker in workers) {
        [worker removeObserver:self];
    }
    
    [workers removeAllObjects];
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)workerDidPerformWorkWithObject:(id)object {
    if ([self.washersDispatcher containsHandler:object]) {
        [self.accountantsDispatcher performWorkWithObject:object];
    } else if ([self.accountantsDispatcher containsHandler:object]) {
        [self.directorsDispatcher performWorkWithObject:object];
    }
}

@end
