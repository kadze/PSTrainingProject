//
//  PSCar.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSCar : NSObject

@property (nonatomic, readonly, copy)   NSString    *designation;
@property (nonatomic, readonly)         BOOL        isClean;
@property (nonatomic, readonly)         NSNumber    *money;
@property (nonatomic, readonly)         NSSet       *cars;

+ (instancetype)createWithDesignation:(NSString *)designation;
- (void)addCar:(PSCar *)car;
- (void)removeCar:(PSCar *)car;

@end
