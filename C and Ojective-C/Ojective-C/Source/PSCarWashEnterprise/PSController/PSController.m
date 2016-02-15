//
//  PSController.m
//  PSTrainingProject
//
//  Created by Сергей on 10.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSController.h"
#import "PSCarWashEnterprise.h"
#import "PSCar.h"
#import "PSDispatch.h"

static const NSTimeInterval kPSTimerInterval        = 0.1;
static const NSUInteger kPSCarsCount                = 1000;
static const NSUInteger kPSFinishIterationsCount    = 99;

@interface PSController ()
@property (nonatomic, retain)   PSCarWashEnterprise *enterprise;
@property (nonatomic, retain)   NSTimer             *timer;
@property (nonatomic, assign)   NSUInteger          startIterationsCount;

- (void)startWork:(NSTimer *)timer;
- (void)performWorkWithObjects:(id)object;

@end

@implementation PSController

@synthesize startIterationsCount;

#pragma mark -
#pragma mark Initiallization and Dealocation

- (void)dealloc {
    self.enterprise = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.enterprise = [PSCarWashEnterprise object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessor

- (void)setWorking:(BOOL)working {
    if (working != _working) {
        _working = working;
        if (working) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:kPSTimerInterval
                                                          target:self
                                                        selector:@selector(startWork:)
                                                        userInfo:nil
                                                         repeats:YES];
        } else {
            self.timer = nil;
        }
    }
}

- (void)setTimer:(NSTimer *)timer {
    if (timer != _timer) {
        [_timer invalidate];
        [_timer release];
        
        _timer = [timer retain];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)startWork:(NSTimer *)timer {
    if (startIterationsCount > kPSFinishIterationsCount) {
        self.working = NO;
    }
    
    startIterationsCount++;

    PSDispatchSyncOnDefaultQueue(^{
        [self performWorkWithObjects:[PSCar objectsWithCount:kPSCarsCount]];
    });
}

- (void)performWorkWithObjects:(id)objects {
    [self.enterprise washCars:objects];
}

@end
