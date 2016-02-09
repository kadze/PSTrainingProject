//
//  PSWorker.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSMoneyProtocol.h"
#import "PSObserverProtocol.h"

typedef NS_ENUM (NSUInteger, PSWorkersState) {
    kPSWorkerDidBecomeFree,
    kPSWorkerDidBecomeBusy,
    kPSWorkerDidPerformWorkWithObject
};

@interface PSWorker : PSObservableObject <PSMoneyProtocol, PSObserverProtocol>
@property (nonatomic, assign)   NSUInteger      salary;
@property (nonatomic, assign)   NSUInteger      experience;

+ (instancetype)worker;
+ (instancetype)workerWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (void)performWorkWithObject:(id<PSMoneyProtocol>)object;

- (void)finishProcessing;
- (void)finishPerformWork:(id)object;

@end
