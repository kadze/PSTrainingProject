//
//  PSObservableObject.h
//  PSTrainingProject
//
//  Created by Сергей on 23.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSObservableObject : NSObject
@property (nonatomic, retain, readonly) NSSet   *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (void)removeObservers;
- (BOOL)containsObserver:(id)observer;

- (void)notifyObserversOnMainThreadWithSelector:(NSString *)selector;
- (void)notifyObserversWithSelector:(NSString *)selector;
- (void)notifyObserversWithSelector:(NSString *)selector withObject:(id)object;

@end
