//
//  PSCarWash.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrefixHeaderCarWash.pch"

@interface PSCarWashEnterprise : NSObject <PSObserverProtocol>

- (void)takeCars:(NSArray *)cars;

@end
