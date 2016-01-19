//
//  PSCar.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCar.h"

@implementation PSCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithMoney:0];
}

- (instancetype)initWithMoney:(uint8_t)money {
    self = [super init];
    
    if (self) {
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark Money Protocol

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    self.money += money;
    moneyKeeper.money -= money;
}

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    self.money -= money;
    moneyKeeper.money += money;
}

@end
