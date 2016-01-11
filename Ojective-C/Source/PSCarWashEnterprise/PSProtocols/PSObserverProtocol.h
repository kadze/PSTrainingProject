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
- (void)PSWorkerFree:(PSWorkers *)workers;
- (void)PSWorkerBusy:(PSWorkers *)workers;
- (void)PSWorkerPerformedWork:(id<PSMoneyProtocol>)object;

@end
