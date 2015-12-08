//
//  PSRoom.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSBuilding.h"

@interface PSRoom : PSBuilding

@property (nonatomic, readonly) NSUInteger  capacity;
@property (nonatomic, readonly) NSArray     *items;

@end
