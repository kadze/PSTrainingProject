//
//  PSCreature.m
//  PSTrainingProject
//
//  Created by Сергей on 20.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCreature.h"

@implementation PSCreature

#pragma mark -
#pragma mark Class Method

+ (PSCreature *) creature{
    return [[[self alloc]init]autorelease];
}
    
+ (PSCreature *) createWithName:(NSString *)name gender:(PSCreatureGenderType *)gender ability:(PSCreatureAbility *)ability {
    return [[[self alloc] criateWithName:name gender:gender ability:ability]autorelease];
}

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.name = nil;
}

- (instancetype)init {
    self = [super init]
    if (self) {
        self.name
        self.gender
        self.ability
    }
}

#pragma mark -
#pragma mark Public Implementations

- (void)seyHelo {
    NSLog(@"Привет!");
}

- (void)addChaild {

}

- (void)removeChaild {

}

@end