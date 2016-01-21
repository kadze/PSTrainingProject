//
//  PSCar.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSMoneyProtocol.h"

@interface PSCar : NSObject <PSMoneyProtocol>
@property (nonatomic, assign, getter=isClean)   BOOL    clean;

- (instancetype)initWithMoney:(NSUInteger)money;

@end
