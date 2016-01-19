//
//  PSWorkers.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSMoneyProtocol.h"

@interface PSWorkers : NSObject <PSMoneyProtocol>
@property (nonatomic, assign)           uint8_t         salary;
@property (nonatomic, assign)           uint8_t         experience;

+ (instancetype)worker;
+ (instancetype)workerWithSalary:(uint8_t)salary experience:(uint8_t)experience;

- (instancetype)initWithSalary:(uint8_t)salary experience:(uint8_t)experience;

@end
