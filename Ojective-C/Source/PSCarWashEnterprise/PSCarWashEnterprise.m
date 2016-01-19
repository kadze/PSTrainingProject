//
//  PSCarWash.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashEnterprise.h"
#import "PrefixHeaderCarWash.pch"

@interface PSCarWashEnterprise ()
@property (nonatomic, readwrite, retain)    NSMutableSet    *mutableWorkers;

@end

@implementation PSCarWashEnterprise
@dynamic workers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableWorkers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableWorkers = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)workers {
    return [[self.mutableWorkers copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)hireAnWorker:(PSWorkers *)worker {
    [self.mutableWorkers addObject:worker];
}

- (void)fireAnWorker:(PSWorkers *)worker {
    [self.mutableWorkers removeObject:worker];
}

- (void)performWorkWithCar:(PSCar *)car {
//    PSWasher *washer = [PSWasher worker];
//    PSAccountant *accountant = [PSAccountant worker];
//    PSDirector *director = [PSDirector worker];
    
//    if (car) {
//        [washer workWithObject:car];
//        [accountant workWithObject:washer];
//        [director workWithObject:accountant];
//    }
}

- (void)performWorkWithCars:(NSSet *)cars {
    for (PSCar *car in cars) {
        [self performWorkWithCar:car];
    }
}

@end
