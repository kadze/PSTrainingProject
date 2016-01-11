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
    kPSWorkerFree,
    kPSWorkerBusy,
    kPSWorkerPerformedWork
};

@interface PSWorkers : PSObservableObject <PSMoneyProtocol, PSObserverProtocol>
@property (nonatomic, retain, readonly) NSSet           *workers;
@property (nonatomic, assign, readonly) PSWorkersState  state;
@property (nonatomic, assign)           uint8_t         salary;

+ (PSWorkers *)pool;

- (instancetype)initWithMoney:(uint8_t)money salary:(uint8_t)salary;

- (void)addWorker:(PSWorkers *)worker;
- (void)removeWorker:(PSWorkers *)worker;

- (BOOL)containsWorker:(PSWorkers *)worker;

- (id)freeWorker;
- (id)freeWorkerWithClass:(Class)class;
- (NSSet *)freeWorkersWithClass:(Class)class;

- (NSUInteger)count;

- (void)workerMayBeFree;
- (void)workerStartWork;
- (void)workerFinishWork;

- (void)performWorkWithObject:(id<PSMoneyProtocol>)object;

- (NSString *)selectorForState:(PSWorkersState)state;

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper;
- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <PSMoneyProtocol>)moneyKeeper;

@end
