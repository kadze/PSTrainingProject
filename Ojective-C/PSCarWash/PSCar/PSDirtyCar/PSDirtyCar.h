//
//  PSDirtyCar.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSCar.h"

@interface PSDirtyCar : PSCar

@property (nonatomic, readonly) NSSet   *cars;

- (void)addCar:(PSDirtyCar *)car;
- (void)removeCar:(PSDirtyCar *)car;

@end
