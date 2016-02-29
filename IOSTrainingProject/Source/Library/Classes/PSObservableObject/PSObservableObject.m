//
//  PSObservableObject.m
//  IOSTrainingProject
//
//  Created by Сергей on 2/26/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSObservableObject.h"

#import "PSAssignReference.h"

#import "PSPragmaMacros.h"

@interface PSObservableObject ()
@property (nonatomic, assign)   BOOL            notificationEnabled;
@property (nonatomic, retain)   NSMutableSet    *mutableObservers;

- (void)notify:(BOOL)shouldNotify whenPerformingBlock:(void(^)(void))block;

@end

@implementation PSObservableObject

@dynamic observers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSMutableSet set];
        self.notificationEnabled = YES;
    }

    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    NSMutableSet *mutableObservers = self.mutableObservers;
    @synchronized(mutableObservers) {
        NSMutableArray *mutableResult = [NSMutableArray arrayWithCapacity:mutableObservers.count];
        for (PSAssignReference *observer in mutableObservers) {
            [mutableResult addObject:observer.target];
        }
        
        return [mutableResult copy];
    }
}

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    if (state != _state) {
        _state = state;
        
        [self notifyObserversWithSelector:[self selectorForState:state] withObject:object];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    @synchronized(self) {
        [self.mutableObservers addObject:[[PSAssignReference alloc] initWithTarget:observer]];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
        [self.mutableObservers removeObject:[[PSAssignReference alloc] initWithTarget:observer]];
    }
}

- (void)removeObserversFromArray:(NSArray *)array {
    @synchronized(self) {
        for (id observer in array) {
            [self removeObserver:observer];
        }
    }
}

- (void)addObserversFromArray:(NSArray *)array {
    @synchronized(self) {
        for (id observer in array) {
            [self addObserver:observer];
        }
    }
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    @synchronized(self) {
        if (!self.notificationEnabled) {
            return;
        }
        for (PSAssignReference *reference in self.mutableObservers) {
            id observer = reference.target;
            if ([observer respondsToSelector:selector]) {
                PSClangDiagnosticPushOption("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
                [observer performSelector:selector withObject:self withObject:object];
                PSClangDiagnosticPopOption
            }
        }
    }
}

- (void)performBlockWithNotification:(void(^)(void))block {
    [self notify:YES whenPerformingBlock:block];
}

- (void)performBlockWithoutNotification:(void(^)(void))block {
    [self notify:NO whenPerformingBlock:block];
    
}

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

#pragma mark -
#pragma mark Private

- (void)notify:(BOOL)shouldNotify whenPerformingBlock:(void(^)(void))block {
    @synchronized(self) {
        BOOL notificationEnabled = self.notificationEnabled;
        self.notificationEnabled = shouldNotify;
        if (block) {
            block();
        }
        
        self.notificationEnabled = notificationEnabled;
    }
}

@end
