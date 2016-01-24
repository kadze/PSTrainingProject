//
//  PSWosher.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWasher.h"
#import "PSCar.h"

const static NSUInteger kPSPrice = 10;

@implementation PSWasher

#pragma mark -
#pragma mark Public

- (void)workWithObject:(PSCar *)car {
    [self takeMoney:kPSPrice fromMoneyKeeper:car];
    [self washCar:car];
}

#pragma mark -
#pragma mark Private

- (void)washCar:(PSCar *)car {
    car.clean = YES;
    NSLog(@"Is car clean: %@ Money is: %lu", (car.isClean) ? @"YES" : @"NO", car.money);
}

@end
