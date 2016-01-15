//
//  PSAccountant.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSWorkers.h"
#import "PSWasher.h"

@interface PSAccountant : PSWorkers

- (void)workWithObject:(PSWasher *)washer;

@end
