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
    
    NSLog(@"Enterprise created: %@", (carwash) ? @"YES" : @"NO");
    
    for (NSUInteger index = 0; index < 50; index++) {
        PSCar *car = [[[PSCar alloc] initWithMoney:10] autorelease];
        [cars addObject:car];
        NSLog(@"Is car number %lu clean: %@ Money is: %lu", index, (car.isClean) ? @"YES" : @"NO", car.money);
    }
    
    [carwash washCars:cars];
    
    [[NSRunLoop currentRunLoop] run];
}

@end
