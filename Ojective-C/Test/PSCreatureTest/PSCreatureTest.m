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
    assert(nil != creatureFirst);
    
    PSCreature *creatureTwo = [PSCreature creatureWithName:@"Bob" gender:kPSMale];
    assert(nil != creatureTwo);
    
    PSCreature *creatureThree = [PSCreature creatureWithName:@"Den" gender:kPSMale];
    assert(nil != creatureThree);
    
    PSCreature *creatureFour = [PSCreature creatureWithName:@"Ket" gender:kPSFemale];
    assert(nil != creatureFour);
    
    [creatureFirst addChild:creatureTwo];
    [creatureFirst addChild:creatureThree];
    [creatureFirst addChild:creatureFour];
    
    NSSet *childrens = [creatureFirst children];
    assert(nil != childrens);
    
    [creatureFirst sayHello];
    
    NSArray *creatures = @[creatureFirst, creatureTwo, creatureThree, creatureFour];
}

@end

