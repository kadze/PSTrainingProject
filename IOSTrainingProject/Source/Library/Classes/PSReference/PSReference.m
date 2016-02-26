//
//  PSReference.m
//  IOSTrainingProject
//
//  Created by Сергей on 2/26/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSReference.h"

@implementation PSReference

@dynamic target;

#pragma mark -
#pragma mark Initializations & Deallications

- (instancetype)initWithTarget:(id)object {
    if (nil == object) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.target = object;
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithTarget:self.target];
}

#pragma mark -
#pragma mark NSObject equality

- (NSUInteger)hash {
    return [self.target hash];
}

- (BOOL)isEqual:(PSReference *)object {
    if (object == self) {
        return YES;
    }
    
    if (object.hash == self.hash && [object isMemberOfClass:[self class]]) {
        return [self isEqualToReference:object];
    }
    
    return NO;
}

- (BOOL)isEqualToReference:(PSReference *)object {
    return object.target == self.target;
}


@end
