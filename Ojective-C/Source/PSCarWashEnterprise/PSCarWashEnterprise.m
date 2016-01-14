//
//  PSCarWash.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashEnterprise.h"

const static NSUInteger kPSPrice = 1;

@interface PSCarWashEnterprise ()
@property (nonatomic, retain)   PSQueue         *cars;
@property (nonatomic, retain)   PSWorkersPool   *worckers;
@property (nonatomic, retain)   PSDispatcher    *washerDispatcher;
@property (nonatomic, retain)   PSDispatcher    *accountantDispatcher;
@property (nonatomic, retain)   PSDispatcher    *directorDispatcher;

- (void)hireDirectors;
- (void)hireAccountants;
- (void)hireWashers;

@end

@implementation PSCarWashEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.cars = nil;
    self.worckers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.cars = [PSQueue queue];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)takeCars:(NSArray *)cars {
    [self hireStaff];
    
    PSDispatcher *washerDispatcher = self.washerDispatcher;
    
    for (PSCar *car in cars) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [washerDispatcher addProcessingObject:car];
        });
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)hireStaff {
    [self hireDirectors];
    [self hireAccountants];
    [self hireWashers];
}

- (void)hireDirectors {
    [self.directorDispatcher addHandler:[PSDirector object]];
    
    NSLog(@"Hired 1 director");
}

- (void)hireAccountants {
    [self.accountantDispatcher addHandler:[PSAccountant object]];
    
    NSLog(@"Hired 1 accountants");
}

- (void)hireWashers {
    PSDispatcher *washerDispatcher = self.washerDispatcher;
    NSUInteger washersCount = arc4random_uniform(10);
    
    for (NSUInteger index = 0; index < washersCount; index++) {
        PSWasher *washer = [[PSWasher alloc] initWithPrice:kPSPrice];
        
        [washer addObserver:self];
        [washerDispatcher addHandler:washer];
    }
    
    NSLog (@"Hired %lu washers", washersCount);
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)PSWorckersDidPerformWorkWithObject:(id<PSMoneyProtocol>)object {
    if ([object isKindOfClass:[PSWasher class]]) {
        [self.accountantDispatcher addProcessingObject:object];
    } else if ([object isKindOfClass:[PSAccountant class]]) {
        [self.directorDispatcher addProcessingObject:object];
    }
}

@end
