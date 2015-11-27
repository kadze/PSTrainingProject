//
//  PSCreatureTest.m
//  PSTrainingProject
//
//  Created by Сергей on 23.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCreatureTest.h"

@implementation PSCreatureTest
@dynamic creatures;

+ (void)PSCreatureTestParameters {
    @autoreleasepool {
        PSCreature *creatureFirst = [PSCreature createWithName:@"Elen" age:30 weight:50 gender:kPSFemale ability:kPSBeget];
            assert(nil != creatureFirst);
    
        PSCreature *creatureTwo = [PSCreature createWithName:@"Bob" age:31 weight:70 gender:kPSMale ability:kPSFight];
            assert(nil != creatureTwo);
        
        PSCreature *creatureThree = [PSCreature createWithName:@"Den" age:32 weight:71 gender:kPSMale ability:kPSFight];
            assert(nil != creatureThree);
     
        PSCreature *creatureFour = [PSCreature createWithName:@"Ket" age:33 weight:51 gender:kPSFemale ability:kPSBeget];
            assert(nil != creatureFour);
        
        [creatureFirst addChild: creatureTwo];
        [creatureFirst addChild: creatureThree];
        [creatureFirst addChild: creatureFour];
        
        NSSet *childrenToCheck = [creatureFirst children];
            assert(nil != childrenToCheck);
        
        [creatureFirst sayHello];
        
        NSArray *creatures = [NSArray arrayWithObjects:creatureFirst, creatureTwo, creatureThree, creatureFour, nil];
        
    }
}

@end
