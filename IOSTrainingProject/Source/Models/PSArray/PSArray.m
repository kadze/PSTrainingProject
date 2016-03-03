//
//  PSArray.m
//  IOSTrainingProject
//
//  Created by Сергей on 2/25/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArray.h"

#import "PSArrayChangesModel+PSArray.h"
#import "PSArrayModelObserver.h"

@interface PSArray ()
@property (nonatomic, strong)   NSMutableArray  *mutableObjects;

@end

@implementation PSArray

@dynamic count;
@dynamic objects;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)objects {
    @synchronized(self) {
        return [self.mutableObjects copy];
    }
}

- (NSUInteger)count {
    @synchronized(self) {
        return self.mutableObjects.count;
    }
}

#pragma mark -
#pragma mark Public

- (id)objectAtIndex:(NSUInteger) index {
    @synchronized(self) {
        return [self.mutableObjects objectAtIndex:index];
    }
}

- (void)addObject:(id)object {
    @synchronized(self) {
        [self.mutableObjects addObject:object];
        
        [self notifyObserversWithChangeModel:[PSArrayChangesModel addModelWithIndex:self.count - 1]];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    @synchronized(self) {
        [self.mutableObjects insertObject:object atIndex:index];
        
        [self notifyObserversWithChangeModel:[PSArrayChangesModel insertModelWithIndex:index]];
    }
}

- (void)removeLastObject {
    @synchronized(self) {
        [self.mutableObjects removeLastObject];
        
        [self notifyObserversWithChangeModel:[PSArrayChangesModel removeModelWithIndex:self.count - 1]];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized(self) {
        [self.mutableObjects removeObjectAtIndex:index];
        
        [self notifyObserversWithChangeModel:[PSArrayChangesModel removeModelWithIndex:index]];
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    @synchronized(self) {
        [self.mutableObjects replaceObjectAtIndex:index withObject:anObject];
        
        [self notifyObserversWithChangeModel:[PSArrayChangesModel replaceModelWithIndex:index]];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    @synchronized(self) {
        [self.mutableObjects exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
        
        [self notifyObserversWithChangeModel:[PSArrayChangesModel exchangeModelWithIndex:firstIndex
                                                                                 toIndex:secondIndex]];
    }
}

- (void)moveObjectFromIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(self) {
        id object = [self objectAtIndex:firstIndex];
        [mutableObjects removeObjectAtIndex:firstIndex];
        [mutableObjects insertObject:object atIndex:secondIndex];
        
        [self notifyObserversWithChangeModel:[PSArrayChangesModel moveModelWithIndex:firstIndex
                                                                             toIndex:secondIndex]];
    }
}

#pragma mark -
#pragma mark Private

- (void)notifyObserversWithChangeModel:(PSArrayChangesModel *)model {
    [self notifyObserversWithSelector:@selector(collection:changeWithModel:) withObject:model];
}

@end
