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
@property (nonatomic, readonly) NSSet   *buildings;

- (void)addBuilding:(PSCarWash *)building;
- (void)addWorker:(PSCarWash *)worker;
- (void)removeWorker:(PSCarWash *)worker;

@end
