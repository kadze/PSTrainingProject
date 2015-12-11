//
//  PSWashBuilding.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWashBuilding.h"

@interface PSWashBuilding ()

@property (nonatomic, retain)   NSMutableArray  *mutableCars;

@end

@implementation PSWashBuilding

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableCars = [[[NSMutableArray alloc] init] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)cars {
    return [[_mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(PSCar *)car {
    [self.mutableCars addObject:car];
}

- (void)removeCar:(PSCar *)car {
    [self.mutableCars removeObject:car];
}

@end
