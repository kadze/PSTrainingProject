//
//  PSCreatureTest.m
//  PSTrainingProject
//
//  Created by Сергей on 23.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCreatureTest.h"
#import "PSCreature.h"

@implementation PSCreatureTest

+ (void)PSCreatureTestParameters {
    PSCreature *creature = [PSCreature createWithName:Bob gender:kPSMale ability:kPSFight];
        assert(nil != creature);
        assert(PSCreature *gender == kPSMale && PSCreature *ability == kPSFight);
        assert(PSCreature *gender == kPSFemale && PSCreature *ability == kPSBeget);
}

@end
