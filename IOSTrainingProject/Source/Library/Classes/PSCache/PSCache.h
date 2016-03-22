//
//  PSCache.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/21/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSCache : NSObject

+ (PSCache *)cache;

- (void)addObject:(id)object forKey:(id)key;

- (void)removeObjectForKey:(id)key;

- (id)objectForKey:(id)key;

@end
