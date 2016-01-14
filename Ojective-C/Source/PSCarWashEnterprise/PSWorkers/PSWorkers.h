//
//  PSWorkers.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PSMoneyProtocol.h"
#import "PSObservableObject.h"
#import "PSObserverProtocol.h"

typedef NS_ENUM (NSUInteger, PSWorkersState) {
    kPSWorkerDidBecomeFree,
    kPSWorkerDidBecomeBusy,
    kPSWorkerDidPerformWorkWithObject
};

@interface PSWorkers : PSObservableObject <PSMoneyProtocol, PSObserverProtocol>
@property (nonatomic, assign, readonly) PSWorkersState  state;
@property (nonatomic, assign)           uint8_t         salary;

- (instancetype)initWithMoney:(uint8_t)money salary:(uint8_t)salary;

- (void)workerMayBeFree;
- (void)workerStartWork;
- (void)workerFinishWork;

- (void)performWorkWithObject:(id<PSMoneyProtocol>)object;

- (NSString *)selectorForState:(PSWorkersState)state;

@end
