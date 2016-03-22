//
//  PSCache.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/21/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSCache.h"

@interface PSCache ()
@property (nonatomic, strong)   NSMapTable  *mapTable;

@end

@implementation PSCache

#pragma mark -
#pragma mark Class Methods

+ (PSCache *)cache {
    static PSCache *__cache = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __cache = [[self alloc] init];
    });
    
    return __cache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mapTable = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object forKey:(id)key {
    @synchronized(self) {
        [self.mapTable setObject:object forKey:key];
    }
}

- (void)removeObjectForKey:(id)key {
    @synchronized(self) {
        [self.mapTable removeObjectForKey:key];
    }
}

- (id)objectForKey:(id)key {
    @synchronized(self) {
        return [self.mapTable objectForKey:key];
    }
}

@end
