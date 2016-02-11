//
//  PSCarWashTest.m
//  PSTrainingProject
//
//  Created by Сергей on 08.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashTest.h"
#import "PSController.h"

@implementation PSCarWashTest

+ (void)carWashEnterpriseTest {
    PSController *controller = [PSController object];
    controller.working = YES;
    
    [[NSRunLoop currentRunLoop] run];
}

@end
