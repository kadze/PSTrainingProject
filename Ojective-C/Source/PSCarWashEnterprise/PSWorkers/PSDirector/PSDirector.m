//
//  PSDirector.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSDirector.h"
#import "PSAccountant.h"

@interface PSDirector ()

- (void)profit;

@end

@implementation PSDirector

#pragma mark -
#pragma mark Public

- (void)workWithObject:(PSAccountant *)accountant {
    [self takeMoney:accountant.money fromMoneyKeeper:accountant];
    [self profit];
}

- (void)performWorkWithObjectOnMainThread:(PSWorkers *)object {
    [object workerMayBeFree];
    
    [self workerMayBeFree];
}

#pragma mark -
#pragma mark Private

- (void)profit {
    usleep(arc4random_uniform(10 * 1000));
    
    NSLog(@"Directors money = %d", self.money);
}

@end
