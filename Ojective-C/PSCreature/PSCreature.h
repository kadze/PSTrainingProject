//
//  PSCreature.h
//  PSTrainingProject
//
//  Created by Сергей on 20.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, PSCreatureGenderType) {
    kPSUndefined,
    kPSMale,
    kPSFemale
};

typedef NS_OPTIONS (NSUInteger, PSCreatureAbility) {
    kPSFight,
    kPSBeget,
};

@interface PSCreature : NSObject

@property (nonatomic, readonly, copy)   NSString                *name;
@property (nonatomic, readonly)         PSCreatureGenderType    *gender;
@property (nonatomic, readonly)         PSCreatureAbility       *ability;
@property (nonatomic, readonly)         NSSet                   *children;
@property (nonatomic, assign)           uint8_t                 age;
@property (nonatomic, assign)           uint8_t                 weight;

+ (PSCreature *) createWithName:(NSString *)name
                            age:(uint8_t)age
                         weight:(uint8_t)weight
                         gender:(PSCreatureGenderType *)gender
                        ability:(PSCreatureAbility *)ability;
- (void)sayHello;
- (void)addChild:(PSCreature *)child ;
- (void)removeChild:(PSCreature *)child;

@end
