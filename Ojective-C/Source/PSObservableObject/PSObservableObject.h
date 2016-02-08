//
//  PSObservableObject.h
//  PSTrainingProject
//
//  Created by Сергей on 23.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSObservableObject : NSObject
@property (nonatomic, readonly) NSSet       *observers;
@property (nonatomic, assign)   NSUInteger  state;

- (void)setState:(NSUInteger)state withObject:(id)object;
- (SEL)selectorForState:(NSUInteger)state;

- (void)addObserver:(id)observer;
- (void)addObservers:(NSArray *)array;
- (void)removeObserver:(id)observer;
- (void)removeObservers;
- (BOOL)containsObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

@end
