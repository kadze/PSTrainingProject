//
//  PSWorkers.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWorkers.h"

@interface PSWorkers ()
@property (nonatomic, assign)   PSWorkersState  state;

@end

@implementation PSWorkers

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithMoney:0 salary:0];
}

- (instancetype)initWithMoney:(uint8_t)money salary:(uint8_t)salary {
    self = [super init];
    
    if (self) {
        self.money = money;
        self.salary = salary;
        self.state = kPSWorkerBusy;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(PSWorkersState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObserversOnMainThreadWithSelector:[self selectorForState:state]];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)workerMayBeFree {
    self.state = kPSWorkerFree;
}

- (void)workerStartWork {
    self.state = kPSWorkerBusy;
}

- (void)workerFinishWork {
    self.state = kPSWorkerPerformedWork;
}

- (void)workWithObject:(id<PSMoneyProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}
    
- (void)performWorkWithObject:(PSWorkers *)object {
    NSLog(@"self = %@ object = %@", self, object);
    
    [self workerStartWork];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self workWithObject:object];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performWorkWithObjectOnMainThread:object];
        });
    });
}

- (void)performWorkWithObjectOnMainThread:(PSWorkers *)object {
    [self workerFinishWork];
    
    [object workerMayBeFree];
}

- (NSString *)selectorForState:(PSWorkersState)state {
    NSDictionary *selectors = @{@(kPSWorkerFree) : NSStringFromSelector(@selector(PSWorkerFree:)),
                                @(kPSWorkerBusy) : NSStringFromSelector(@selector(PSWorkerBusy:)),
                                @(kPSWorkerPerformedWork) : NSStringFromSelector(@selector(PSWorkerPerformedWork:))};
    
    return selectors[@(state)];
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
