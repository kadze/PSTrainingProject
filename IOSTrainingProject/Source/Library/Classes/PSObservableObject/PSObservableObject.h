//
//  PSObservableObject.h
//  IOSTrainingProject
//
//  Created by Сергей on 2/26/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSArray     *observers;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (void)removeObserversFromArray:(NSArray *)array;
- (void)addObserversFromArray:(NSArray *)array;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (void)performBlockWithNotification:(void(^)(void))block;
- (void)performBlockWithoutNotification:(void(^)(void))block;

- (SEL)selectorForState:(NSUInteger)state;

@end
