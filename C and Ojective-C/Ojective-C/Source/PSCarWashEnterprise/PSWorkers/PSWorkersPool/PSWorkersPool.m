////
////  PSWorkersPool.m
////  PSTrainingProject
////
////  Created by Сергей on 14.01.16.
////  Copyright © 2016 Сергей. All rights reserved.
////
//
//#import "PSWorkersPool.h"
//#import "PSObjectExtensions.h"
//
//@interface PSWorkersPool ()
//@property (nonatomic, retain)   NSMutableSet    *mutableWorkers;
//
//@end
//
//@implementation PSWorkersPool
//@dynamic workers;
//
//#pragma mark -
//#pragma mark Class methods
//
//+ (PSWorkersPool *)pool {
//    return [self object];
//}
//
//#pragma mark -
//#pragma mark Allocations and Deallocations
//
//- (void)dealloc {
//    self.mutableWorkers = nil;
//    
//    [super dealloc];
//}
//
//- (instancetype)init {
//    self = [super init];
//    
//    if (self) {
//        self.mutableWorkers = [NSMutableSet set];
//    }
//    
//    return self;
//}
//
//#pragma mark -
//#pragma mark Accessors
//
//- (NSSet *)workers {
//    @synchronized(_mutableWorkers) {
//        return [[_mutableWorkers copy] autorelease];
//    }
//}
//
//#pragma mark -
//#pragma mark Public Methods
//
//- (void)addWorker:(PSWorkers *)worker {
//    @synchronized (_mutableWorkers) {
//        [_mutableWorkers addObject:worker];
//    }
//}
//
//- (void)removeWorker:(PSWorkers *)worker {
//    @synchronized (_mutableWorkers) {
//        [_mutableWorkers removeObject:worker];
//    }
//}
//
//- (id)freeWorker {
//    __block PSWorkers *freeWorker = nil;
//    
//    @synchronized (_mutableWorkers) {
//        [_mutableWorkers enumerateObjectsUsingBlock:^(PSWorkers *worker, BOOL *stop) {
//            if (kPSWorkerDidBecomeFree == worker.state) {
//                freeWorker = worker;
//                *stop = YES;
//            }
//        }];
//    }
//    
//    return freeWorker;
//}
//
//- (id)freeWorkerWithClass:(Class)class {
//    __block PSWorkers *freeWorker = nil;
//    
//    @synchronized (_mutableWorkers) {
//        [_mutableWorkers enumerateObjectsUsingBlock:^(PSWorkers *worker, BOOL *stop) {
//            if ([worker isMemberOfClass:class] && kPSWorkerDidBecomeFree == worker.state) {
//                freeWorker = worker;
//                *stop = YES;
//            }
//        }];
//    }
//    
//    return freeWorker;
//}
//
//- (NSSet *)freeWorkersWithClass:(Class)class {
//    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(PSWorkers *worker, NSDictionary *bindings) {
//        return ([worker isMemberOfClass:class]
//                && worker.state == kPSWorkerDidBecomeFree);
//    }];
//    
//    return [self.workers filteredSetUsingPredicate:predicate];
//}
//
//- (BOOL)containsWorker:(PSWorkers *)worker {
//    @synchronized (_mutableWorkers) {
//        return [self.mutableWorkers containsObject:worker];
//    }
//}
//
//- (NSUInteger)count {
//    @synchronized (_mutableWorkers) {
//        return [self.mutableWorkers count];
//    }
//}
//
//@end
