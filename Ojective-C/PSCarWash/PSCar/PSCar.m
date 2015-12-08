//
//  PSCar.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCar.h"

@interface PSCar ()

@property (nonatomic, readwrite, copy)  NSString        *designation;
@property (nonatomic, retain)           NSMutableSet    *mutableCars;

@end

@implementation PSCar

#pragma mark -
#pragma mark Class Method

+ (instancetype)createWithDesignation:(NSString *)designation {
    return [[[self alloc] initWithDesignation:designation] autorelease];
}

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.designation = nil;
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

- (instancetype)initWithDesignation:(NSString *)designation {
    self = [self init];
    if (self) {
        self.designation = designation;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSSet *)cars {
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
