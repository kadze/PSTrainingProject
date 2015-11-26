//
//  PSCreature.m
//  PSTrainingProject
//
//  Created by Сергей on 20.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCreature.h"
#import "PSCreatureTest.h"

@interface PSCreature ()

@property (nonatomic, readwrite, copy)  NSString                *name;
@property (nonatomic, retain)           NSMutableSet            *mutableChildren;
@property (nonatomic, readwrite)        PSCreatureGenderType    *gender;
@property (nonatomic, readwrite)        PSCreatureAbility       *ability;

@end

@implementation PSCreature

#pragma mark -
#pragma mark Class Method

+ (PSCreature *) creature{
    return [self createWithName:(NSString *)nil
                         gender:(PSCreatureGenderType *)kPSUndefined
                        ability:(PSCreatureAbility *)kPSUndefined];
}
    
+ (PSCreature *) createWithName:(NSString *)name
                         gender:(PSCreatureGenderType *)gender
                        ability:(PSCreatureAbility *)ability {
    return [[[self alloc] initWithName:name gender:gender ability:ability]autorelease];
}

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableChildren = [[[NSMutableSet alloc]init]autorelease];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                      gender:(PSCreatureGenderType *)gender
                     ability:(PSCreatureAbility *)ability {
    self = [self init];
    if (self) {
        self.name = name;
        self.gender = gender;
        self.ability = ability;
    }
    return self;
}

#pragma mark -
#pragma mark Accesors

-(NSSet *)children {
    return [[_mutableChildren copy]autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)seyHelo {
    NSLog(@"Привет!");
    for (PSCreature *child in self.mutableChildren) {
        [child seyHelo];
    }
}

- (void)addChild:(PSCreature *)child {
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(PSCreature *)child {
    [self.mutableChildren removeObject:child];
}

@end