//
//  PSBeing.m
//  PSTrainingProject
//
//  Created by Сергей on 20.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSBeing.h"

@implementation PSBeing

#pragma mark -
#pragma mark Class Method

+ (PSBeing *) being{
    return [[[self alloc]init]autorelease];
}
    
+ (PSBeing *) criateWithName:(NSString *)name age:(NSNumber *)age weight:(NSNumber *)weight {
    return [[[self alloc] criateWithName:name age:age weight:weight]autorelease];
}

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    criateWithName;
    
}

- (instancetype)init {
    self = [super init]
    if (self) {
        self.name
        self.gender
        self.weight
    }
}

#pragma mark -
#pragma mark Public Implementations

- (void)seyHelo {
    NSLog(@"Привет!");
}

- (void)posibilityFight {

}

- (void)posibilityGiveBirthTo {

}

- (void)addChaild {

}

- (void)removeChaild {

}

@end