//
//  PSCreature.h
//  PSTrainingProject
//
//  Created by Сергей on 20.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, PSCreatureGenderType) {
    kPSMale,
    kPSFemale
};

@interface PSCreature : NSObject
@property (nonatomic, readonly, copy)   NSString                *name;
@property (nonatomic, readonly)         PSCreatureGenderType    gender;
@property (nonatomic, readonly)         NSSet                   *children;
@property (nonatomic, assign)           uint8_t                 age;
@property (nonatomic, assign)           uint8_t                 weight;

+ (instancetype)creatureWithName:(NSString *)name gender:(PSCreatureGenderType)gender;
- (void)sayHello;
- (void)addChild:(PSCreature *)child;
- (void)removeChild:(PSCreature *)child;
- (void)ableToFigth;
- (void)ableToBeget;

@end

