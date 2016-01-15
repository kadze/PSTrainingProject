//
//  PSDirector.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSWorkers.h"
#import "PSAccountant.h"

@interface PSDirector : PSWorkers

- (void)workWithObject:(PSAccountant *)accountant;

@end
