//
//  PSCarWash.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSCarWashEnterprise : NSObject

@property (nonatomic, readonly) NSSet   *workers;
@property (nonatomic, readonly) NSSet   *buildings;

- (void)addBuilding:(PSCarWashEnterprise *)building;
- (void)addWorker:(PSCarWashEnterprise *)worker;
- (void)removeWorker:(PSCarWashEnterprise *)worker;

@end
