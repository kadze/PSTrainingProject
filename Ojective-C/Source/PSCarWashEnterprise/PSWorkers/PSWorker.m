//
//  PSWorker.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSWorker.h"

@interface PSWorker ()
@property (nonatomic, assign)   PSWorkersState  state;

@end

@implementation PSWorker
@synthesize money = _money;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)worker {
    return [[[self alloc] initWithSalary:0 experience:0] autorelease];
}

+ (instancetype)workerWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    return [[[self alloc] initWithSalary:salary experience:experience] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    self = [super init];
    
    if (self) {
        self.salary = salary;
        self.experience = experience;
        self.state = kPSWorkerDidBecomeFree;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(PSWorkersState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)workWithObject:(id)object {
     [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkWithObject:(id<PSMoneyProtocol>)object {
    self.state = kPSWorkerDidBecomeBusy;
    [self workWithObject:object];
    [self finishProcessing];
    [self finishPerformWork];
}

- (void)finishProcessing {
    self.state = kPSWorkerDidPerformWorkWithObject;
}

- (void)finishPerformWork {
    [self setState:kPSWorkerDidBecomeFree];
}

- (SEL)selectorForState:(PSWorkersState)state {
    NSDictionary *selectors = @{@(kPSWorkerDidBecomeFree) : NSStringFromSelector(@selector(PSWorkerDidBecomeFree:)),
                                @(kPSWorkerDidBecomeBusy) : NSStringFromSelector(@selector(PSWorkerDidBecomeBusy:)),
                                @(kPSWorkerDidPerformWorkWithObject) : NSStringFromSelector(@selector(PSWorkerDidPerformWorkWithObject:))};
    
    return NSSelectorFromString(selectors[@(state)]);
}

#pragma mark -
#pragma mark Money Protocol

- (void)takeMoney:(NSUInteger)money fromMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper {
    [self takeMoney:money];
    [moneyKeeper giveMoney:money];
}

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (void)giveMoney:(NSUInteger)money {
    self.money -= money;
}

#pragma mark -
#pragma mark PSObserverProtocol

- (void)PSWorkerDidPerformWorkWithObject:(id<PSMoneyProtocol>)object {
    [self performWorkWithObject:object];
}

@end
