//
//  PSObservableObject.m
//  PSTrainingProject
//
//  Created by Сергей on 23.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSObservableObject.h"

@interface PSObservableObject ()
@property (nonatomic, retain)   NSHashTable *observersHashTable;

@end

@implementation PSObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.observersHashTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observersSet {
    return self.observersHashTable.setRepresentation;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    [self.observersHashTable addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.observersHashTable removeObject:observer];
}

- (void)removeObservers {
    [self.observersHashTable removeAllObjects];
}

- (BOOL)containsObserver:(id)observer {
    return [self.observersHashTable containsObject:observer];
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:self];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    for (id observer in self.observersHashTable) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:object];
        }
    }
}

@end
