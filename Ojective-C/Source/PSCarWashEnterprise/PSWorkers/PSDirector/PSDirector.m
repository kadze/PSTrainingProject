//
//  PSDirector.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSDirector.h"
#import "PSAccountant.h"

@implementation PSDirector

#pragma mark -
#pragma mark Public

- (void)workWithObject:(PSAccountant *)accountant {
    [self takeMoney:accountant.money fromMoneyKeeper:accountant];
    NSLog(@"Accountant money = %lu", accountant.money);
    [self profit];
}

#pragma mark -
#pragma mark Private

- (void)profit {
    NSLog(@"Directors money = %lu", self.money);
}

@end
