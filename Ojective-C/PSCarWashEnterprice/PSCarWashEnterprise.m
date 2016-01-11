//
//  PSCarWash.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWashEnterprise.h"

@interface PSCarWashEnterprise ()

@property (nonatomic, retain)   NSMutableSet    *mutableBuilding;
@property (nonatomic, retain)   NSMutableSet    *mutableWorker;

@end

@implementation PSCarWashEnterprise

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.mutableBuilding = nil;
    self.mutableWorker = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableBuilding = [[[NSMutableSet alloc] init] autorelease];
        self.mutableWorker = [[[NSMutableSet alloc] init] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSSet *)buildings {
    return [[_mutableBuilding copy] autorelease];
}

- (NSSet *)workers {
    return [[_mutableWorker copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods


- (void)addBuilding:(PSCarWashEnterprise *)building {
    [self.mutableBuilding addObject:building];
}

- (void)addWorker:(PSCarWashEnterprise *)worker {
    [self.mutableWorker addObject:worker];
}

- (void)removeWorker:(PSCarWashEnterprise *)worker {
    [self.mutableWorker removeObject:worker];
}

@end
