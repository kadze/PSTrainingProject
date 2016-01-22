//
//  PSCarWashTest.m
//  PSTrainingProject
//
//  Created by Сергей on 08.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashTest.h"
#import "PSCarWashEnterprise.h"

@implementation PSCarWashTest

+ (void)carWashEnterpriseTest {
    NSMutableArray *cars = [NSMutableArray array];
    PSCarWashEnterprise *carwash = [PSCarWashEnterprise object];
    
    NSLog(@"Enterprise is: %@", carwash);
    
    for (NSUInteger index = 1; index <= 2; index++) {
        PSCar *car = [[[PSCar alloc] initWithMoney:10] autorelease];
        [cars addObject:car];
        NSLog(@"Is car clean: %@ Money is: %lu", (car.isClean) ? @"YES" : @"NO", car.money);
        [carwash washCar:car];
    }
}

@end
