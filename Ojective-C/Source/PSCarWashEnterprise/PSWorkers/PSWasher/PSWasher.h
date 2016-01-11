//
//  PSWosher.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSWorkers.h"

@interface PSWasher : PSWorkers
@property (nonatomic, assign) uint8_t price;

- (instancetype)initWithPrice:(uint8_t)price;

@end
