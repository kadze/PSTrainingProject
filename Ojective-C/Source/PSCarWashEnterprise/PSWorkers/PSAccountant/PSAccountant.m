//
//  PSAccountant.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSAccountant.h"
#import "PSWasher.h"

@implementation PSAccountant

#pragma mark -
#pragma mark Public

- (void)workWithObject:(PSWasher *)washer {
    [self takeMoney:washer.money fromMoneyKeeper:washer];
    [self count];
}

#pragma mark -
#pragma mark Private

- (void)count {
//    sleep(1);
    NSLog(@"Accountant money = %lu", self.money);
}

@end
