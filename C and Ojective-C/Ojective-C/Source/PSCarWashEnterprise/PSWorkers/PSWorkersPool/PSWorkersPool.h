//
//  PSWorkersPool.h
//  PSTrainingProject
//
//  Created by Сергей on 14.01.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSWorkers.h"

@interface PSWorkersPool : NSObject
@property (nonatomic, retain, readonly) NSSet   *workers;

+ (PSWorkersPool *)pool;

- (void)addWorker:(PSWorkers *)worker;
- (void)removeWorker:(PSWorkers *)worker;

- (BOOL)containsWorker:(PSWorkers *)worker;

- (id)freeWorker;
- (id)freeWorkerWithClass:(Class)class;
- (NSSet *)freeWorkersWithClass:(Class)class;

- (NSUInteger)count;

@end
