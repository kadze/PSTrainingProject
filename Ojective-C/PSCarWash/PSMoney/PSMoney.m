//
//  PSMoney.m
//  PSTrainingProject
//
//  Created by Сергей on 10.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import "PSMoney.h"

@implementation PSMoney

+ (instancetype)createWithMoney:(NSNumber *)money {
    return [[[self alloc] initWithMoney:money] autorelease];
}

#pragma mark -
#pragma mark Initialization & Deallocations

- (void)dealloc {
    self.noney = Nil;
    
    [super dealloc];
}


- (instancetype)initWithMoney:(NSNumber *)money {
    self = [self init];
    if (self) {
        self.money = money;
    }
    
    return self;
}


- (void)receivingMoney {

}

@end
