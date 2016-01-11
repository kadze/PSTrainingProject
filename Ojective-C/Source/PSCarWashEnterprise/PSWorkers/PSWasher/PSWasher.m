//
//  PSWosher.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWasher.h"
#import "PSCar.h"

@interface PSWasher ()

- (void)washCar:(PSCar *)car;

@end

@implementation PSWasher

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithPrice:(uint8_t)price {
    self = [super init];
    
    if (self) {
        self.price = price;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)workWithObject:(PSCar *)car {
    [self takeMoney:self.price fromMoneyKeeper:car];
    [self washCar:car];
}

- (void)performWorkWithObjectOnMainThread:(PSWorkers *)object {
    [self workerFinishWork];
}

#pragma mark -
#pragma mark Private

- (void)washCar:(PSCar *)car {
    usleep(arc4random_uniform(100));
    car.clean = YES;
}

@end
