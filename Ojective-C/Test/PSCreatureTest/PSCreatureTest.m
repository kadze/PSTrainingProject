//
//  PSCreatureTest.m
//  PSTrainingProject
//
//  Created by Сергей on 08.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCreatureTest.h"
#import "PSCreature.h"

@implementation PSCreatureTest

+ (void)creatureTestParameters {
    PSCreature *creatureFirst = [PSCreature creatureWithName:@"Elen" gender:kPSFemale];
    [creatureFirst setWeight:30];
    [creatureFirst setWeight:50];
    assert(nil != creatureFirst);
    
    PSCreature *creatureTwo = [PSCreature creatureWithName:@"Bob" gender:kPSMale];
    [creatureTwo setAge:10];
    [creatureTwo setWeight:22];
    assert(nil != creatureTwo);
    [creatureFirst addChild:creatureTwo];
    
    PSCreature *creatureThree = [PSCreature creatureWithName:@"Den" gender:kPSMale];
    [creatureThree setAge:9];
    [creatureThree setWeight:18];
    assert(nil != creatureThree);
    [creatureFirst addChild:creatureThree];
    
    PSCreature *creatureFour = [PSCreature creatureWithName:@"Ket" gender:kPSFemale];
    [creatureFour setAge:8];
    [creatureFour setWeight:14];
    assert(nil != creatureFour);
    [creatureFirst addChild:creatureFour];
    
    NSSet *childrens = [creatureFirst children];
    assert(nil != childrens);
    
    [creatureFirst sayHello];
    
    NSArray *creatures = @[creatureFirst, creatureTwo, creatureThree, creatureFour];
    assert(nil != creatures);
}

@end
