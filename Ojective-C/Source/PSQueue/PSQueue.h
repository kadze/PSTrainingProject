//
//  PSQueue.h
//  PSTrainingProject
//
//  Created by Сергей on 24.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSQueue : NSObject
@property (nonatomic, assign, readonly, getter=isEmpty) BOOL    empty;

+ (PSQueue *)queue;
+ (instancetype)queueWithSet:(NSSet *)set;

- (instancetype)initWithSet:(NSSet *)set;

- (void)enqueueObject:(id)object;
- (id)dequeueObject;
- (NSUInteger)count;

@end
