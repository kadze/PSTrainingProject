//
//  PSCarWash.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCarWash.h"

@interface PSCarWash ()

@property (nonatomic, retain)           NSMutableSet            *mutableRoom;
@property (nonatomic, retain)           NSMutableSet            *mutableWorker;

@end

@implementation PSCarWash

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.mutableRoom = nil;
    self.mutableWorker = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableRoom = [[[NSMutableSet alloc] init] autorelease];
        self.mutableWorker = [[[NSMutableSet alloc] init] autorelease];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSSet *)rooms {
    return [[_mutableRoom copy] autorelease];
}

- (NSSet *)workers {
    return [[_mutableWorker copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods


- (void)addRoom:(NSSet *)room {

}

- (void)addWorker:(NSSet *)worker {

}

- (void)removeWorker:(NSSet *)worker {

}

@end
