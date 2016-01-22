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
     NSLog(@"Washer money = %lu", washer.money);
    [self count];
}

#pragma mark -
#pragma mark Private

- (void)count {
    NSLog(@"Accountant money = %lu", self.money);
}

@end
