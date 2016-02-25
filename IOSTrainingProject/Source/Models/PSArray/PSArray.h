//
//  PSArray.h
//  IOSTrainingProject
//
//  Created by Сергей on 2/25/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSArray : NSObject 
@property (nonatomic, readonly) NSUInteger  count;
@property (nonatomic, readonly) NSArray     *objects;

- (id)objectAtIndex:(NSUInteger) index;
- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)exchangeObjectAtIndex:(NSUInteger)index1 withObjectAtIndex:(NSUInteger)index2;
- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
