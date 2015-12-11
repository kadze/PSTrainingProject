//
//  PSCarWashTest.m
//  PSTrainingProject
//
//  Created by Сергей on 08.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashTest.h"
#import "PSCar.h"

@implementation PSCarWashTest

+ (void)createCar {
    PSCar *carOne = [PSCar createWithDesignation:@"Hyndai"];
    [carOne clean:NO];
    assert(carOne);
    
}

@end
