//
//  PSDirtyCar.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSDirtyCar.h"

@interface PSDirtyCar ()

@property (nonatomic, retain)   NSMutableSet    *mutableCars;

@end

@implementation PSDirtyCar

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableCars = [[[NSMutableSet alloc] init] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

-(NSSet *)cars {
    return [[_mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(PSDirtyCar *)car {
    [self.mutableCars addObject:car];
}

- (void)removeCar:(PSDirtyCar *)car {
    [self.mutableCars removeObject:car];
}

@end
