//
//  PSWosher.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWasher.h"
#import "PSCar.h"

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

#pragma mark -
#pragma mark Private

- (void)washCar:(PSCar *)car {
    car.clean = YES;
}

@end
