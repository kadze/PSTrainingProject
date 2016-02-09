//
//  PSDispatcher.h
//  PSTrainingProject
//
//  Created by Сергей on 04.01.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PSObserverProtocol.h"

@interface PSDispatcher : NSObject <PSObserverProtocol>
@property (nonatomic, retain)   NSArray *handlers;

- (void)addHandler:(id)handler;
- (void)removeHandler:(id)handler;

- (BOOL)containsHandler:(id)handler;

- (void)performWorkWithObject:(id)object;

@end
