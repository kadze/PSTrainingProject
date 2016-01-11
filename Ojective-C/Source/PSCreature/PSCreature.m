//
//  PSCreature.m
//  PSTrainingProject
//
//  Created by Сергей on 20.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCreature.h"

@interface PSCreature ()
@property (nonatomic, readwrite, copy)  NSString                *name;
@property (nonatomic, readwrite)        PSCreatureGenderType    gender;
@property (nonatomic, retain)           NSMutableSet            *mutableChildren;

@end

@implementation PSCreature

#pragma mark -
#pragma mark Class Method

+ (instancetype)creatureWithName:(NSString *)name gender:(PSCreatureGenderType)gender {
    return [[[self alloc] initWithName:name gender:gender] autorelease];
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
        self.mutableChildren = [[[NSMutableSet alloc] init] autorelease];
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name gender:(PSCreatureGenderType)gender{
    self = [self init];
    if (self) {
        self.name = name;
        self.gender = gender;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSSet *)children {
    return [[_mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)sayHello {
    NSLog(@"%@ - Привет!", self.name);
    for (PSCreature *child in self.mutableChildren) {
        [child sayHello];
    }
}

- (void)addChild:(PSCreature *)child {
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(PSCreature *)child {
    [self.mutableChildren removeObject:child];
}

- (void)ableToFigth {
    if (self.gender == kPSMale) {
        NSLog(@"%@ abel to figth", self.name);
    }
}

- (void)ableToBeget {
    if (self.gender == kPSFemale) {
        NSLog(@"%@ abel to beget", self.name);
    }
}

@end
