//
//  PSCarWash.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSCarWash : NSObject

@property (nonatomic, readonly) NSSet   *workers;
@property (nonatomic, readonly) NSSet   *rooms;

- (void)addRooms:(NSSet *)rooms;
- (void)addWorkers:(NSSet *)worker;
- (void)removeWorkers:(NSSet *)worker;

@end
