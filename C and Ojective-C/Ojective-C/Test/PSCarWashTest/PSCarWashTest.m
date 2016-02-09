//
//  PSCarWashTest.m
//  PSTrainingProject
//
//  Created by Сергей on 08.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashTest.h"
#import "PSCarWashEnterprise.h"
#import "PSCar.h"

@implementation PSCarWashTest

+ (void)carWashEnterpriseTest {
    NSMutableArray *cars = [NSMutableArray array];
    PSCarWashEnterprise *carwash = [PSCarWashEnterprise object];

    for (NSUInteger index = 0; index < 500000; index++) {
        PSCar *car = [[[PSCar alloc] initWithMoney:10] autorelease];
        [cars addObject:car];
    }
    
    [carwash washCars:cars];
    
    [[NSRunLoop currentRunLoop] run];
}

@end
