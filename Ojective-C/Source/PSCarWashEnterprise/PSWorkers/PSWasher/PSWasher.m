//
//  PSWasher.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWasher.h"
#import "PSCar.h"

@implementation PSWasher

#pragma mark -
#pragma mark Public

- (void)workWithObject:(PSCar *)car {
    [self takeMoney:car.money fromMoneyKeeper:car];
    [self washCar:car];
}

#pragma mark -
#pragma mark Private

- (void)washCar:(PSCar *)car {
    car.clean = YES;
    NSLog(@"Is car clean: %@ Money is: %lu", (car.isClean) ? @"YES" : @"NO", car.money);
}

- (void)finishPerformWork:(PSCar *)car {

}

@end
