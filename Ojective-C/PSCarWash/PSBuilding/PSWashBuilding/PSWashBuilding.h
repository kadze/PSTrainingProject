//
//  PSWashBuilding.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSRoom.h"
#import "PSCar.h"

@interface PSWashBuilding : PSRoom

@property (nonatomic, readonly) NSArray *cars;

- (void)addCar:(PSCar *)car;
- (void)removeCar:(PSCar *)car;

@end
