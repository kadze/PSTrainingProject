//
//  PSQueue.m
//  PSTrainingProject
//
//  Created by Сергей on 24.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSQueue.h"

@interface PSQueue ()
@property (nonatomic, retain)   NSMutableArray  *queue;

@end

@implementation PSQueue

#pragma mark -
#pragma mark Class methods

+ (PSQueue *)queue {
    return [self object];
}

+ (instancetype)queueWithSet:(NSSet *)set {
    return [[[self alloc] initWithSet:set] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithSet:nil];
}

- (instancetype)initWithSet:(NSSet *)set {
    self = [super init];
    
    if (self) {
        self.queue = [NSMutableArray array];
        
        for (id object in set) {
            [self.queue addObject:object];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isEmpty {
    return ([self count] == 0);
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueueObject:(id)object {
    @synchronized(self) {
        [self.queue addObject:object];
    }
}

- (id)dequeueObject {
    @synchronized (self) {
        id queue = self.queue;
        id object = [[[queue firstObject] retain] autorelease];
        if (object) {
            [queue removeObjectAtIndex:0];
        }
        
        return object;
    }
}

- (NSUInteger)count {
    @synchronized(self) {
        return [self.queue count];
    }
}

@end
