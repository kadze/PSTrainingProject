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
- (void)workerDidBecomeFree:(id)worker;
- (void)workerDidBecomeBusy:(id)worker;

- (void)workerDidPerformWorkWithObject:(id)worker;

@end
