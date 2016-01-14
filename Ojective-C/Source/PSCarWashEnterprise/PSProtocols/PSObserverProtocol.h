//
//  PSObserverProtocol.h
//  PSTrainingProject
//
//  Created by Сергей on 21.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSMoneyProtocol.h"

@class PSWorkers;

@protocol PSObserverProtocol <NSObject>

@optional
- (void)PSWorkerDidBecomeFree:(PSWorkers *)worker;
- (void)PSWorkerDidBecomeBusy:(PSWorkers *)worker;
- (void)PSWorkerDidPerformWorkWithObject:(id<PSMoneyProtocol>)object;

@end
