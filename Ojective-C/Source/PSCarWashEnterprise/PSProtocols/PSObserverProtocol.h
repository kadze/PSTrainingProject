//
//  PSObserverProtocol.h
//  PSTrainingProject
//
//  Created by Сергей on 21.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSMoneyProtocol.h"

@class PSWorker;

@protocol PSObserverProtocol <NSObject>

@optional
- (void)PSWorkerDidBecomeFree:(PSWorker *)worker;
- (void)PSWorkerDidBecomeBusy:(PSWorker *)worker;

- (void)PSWorkerDidPerformWorkWithObject:(id<PSMoneyProtocol>)object;

@end
