//
//  PSCar.h
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSCar : NSObject

@property (nonatomic, readonly, copy)           NSString    *designation;
@property (nonatomic, getter=isClean, readonly) BOOL        clean;
@property (nonatomic, readonly)                 NSNumber    *money;

+ (instancetype)createWithDesignation:(NSString *)designation;

@end
