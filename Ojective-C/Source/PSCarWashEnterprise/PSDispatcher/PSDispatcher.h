//
//  PSDispatcher.h
//  PSTrainingProject
//
//  Created by Сергей on 04.01.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PSObserverProtocol.h"

@class PSWorkers;

@interface PSDispatcher : NSObject <PSObserverProtocol>

- (void)addProcessingObject:(id)object;
- (void)addHandler:(PSWorkers *)handler;
- (void)removeHandler:(PSWorkers *)handler;

@end
