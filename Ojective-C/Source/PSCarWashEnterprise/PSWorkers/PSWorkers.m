//
//  PSWorkers.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWorkers.h"

@implementation PSWorkers
@synthesize money = _money;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)worker {
    return [[[self alloc] initWithSalary:0 experience:0] autorelease];
}

+ (instancetype)workerWithSalary:(uint8_t)salary experience:(uint8_t)experience {
    return [[[self alloc] initWithSalary:salary experience:experience] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSalary:(uint8_t)salary experience:(uint8_t)experience {
    self = [super init];
    
    if (self) {
        self.salary = salary;
        self.experience = experience;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)workWithObject:(id<PSMoneyProtocol>)object {

}
    
- (void)performWorkWithObject:(PSWorkers *)object {
    NSLog(@"self = %@ object = %@", self, object);
    [self workWithObject:object];
}

#pragma mark -
#pragma mark Money Protocol

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    @synchronized(moneyKeeper) {
        self.money += money;
        moneyKeeper.money -= money;
    }
}

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    @synchronized(moneyKeeper) {
        self.money -= money;
        moneyKeeper.money += money;
    }
}

@end

