//
//  PSCarWashTest.m
//  PSTrainingProject
//
//  Created by Сергей on 08.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashTest.h"
#import "PSCarWashEnterprise.h"
#import "PrefixHeaderCarWash.pch"


@implementation PSCarWashTest

+ (void)carWashEnterpriseTest {
    
    NSMutableArray *cars = [NSMutableArray array];
    PSCarWashEnterprise *carwash = [PSCarWashEnterprise object];
    
    NSLog(@"Enterprise is: %@", carwash);
    
    PSDirector *director = [[PSDirector worker] initWithSalary:3 experience:3];
    [carwash hireAnWorker:director];
    NSLog(@"Director is: %@", director);
    
    PSAccountant *accountant = [[PSAccountant worker] initWithSalary:2 experience:2];
    [carwash hireAnWorker:accountant];
    NSLog(@"Accountant is: %@", accountant);
    
    PSWasher *washer = [[PSWasher worker] initWithSalary:1 experience:1];
    [carwash hireAnWorker:washer];
    NSLog(@"Washerman is: %@", washer);
    
    for (NSUInteger index = 1; index <= 2; index++) {
        PSCar *car = [[[PSCar alloc] initWithMoney:20] autorelease];
        [cars addObject:car];
        NSLog(@"Is car clean: %@ Money is: %u", (car.isClean) ? @"YES" : @"NO", car.money);
    }
    
    for (PSCar *car in cars) {
        [washer workWithObject:car];
        [accountant workWithObject:washer];
        [director workWithObject:accountant];
        NSLog(@"Is car clean: %@ Money is: %u", (car.isClean) ? @"YES" : @"NO", car.money);
    }
}

@end
