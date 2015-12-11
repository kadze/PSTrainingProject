//
//  PSCar.m
//  PSTrainingProject
//
//  Created by Сергей on 07.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSCar.h"

@interface PSCar ()

@property (nonatomic, readwrite, copy)  NSString    *designation;

@end

@implementation PSCar

#pragma mark -
#pragma mark Class Method

+ (instancetype)createWithDesignation:(NSString *)designation {
    return [[[self alloc] initWithDesignation:designation] autorelease];
}

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.designation = nil;
    
    [super dealloc];
}

- (instancetype)initWithDesignation:(NSString *)designation {
    self = [self init];
    if (self) {
        self.designation = designation;
    }
    
    return self;
}

@end
