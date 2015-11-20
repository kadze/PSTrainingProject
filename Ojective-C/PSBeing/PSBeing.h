//
//  PSBeing.h
//  PSTrainingProject
//
//  Created by Сергей on 20.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kPSMale,
    kPSFemale
} PSBeingGenderType;

@interface PSBeing : NSObject

@property (nonatomic, readonly, copy) NSString      *name;
@property (nonatomic, readonly) PSBeingGenderType   *gender;
@property (nonatomic, readonly) NSNumber            *weight;
@property (nonatomic, readonly) NSNumber            *age;
@property (nonatomic, readonly) NSSet               *children;

+ (PSBeing *) being;
- (void)seyHelo;
- (void)posibilityFight;
- (void)posibilityGiveBirthTo;
- (void)addChaild;
- (void)removeChaild;

@end
