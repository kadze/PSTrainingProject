//
//  PSModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/4/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSModel.h"

#import "PSArrayModelObserver.h"
#import "PSDispatch.h"

#import "PSWeakifyMacros.h"

@implementation PSModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized(self) {
        NSUInteger state = self.state;
        
        if (kPSModelDidLoad == state || kPSModelWillLoad == state) {
            [self notifyObserversWithSelector:[self selectorForState:state]];
            
            return;
        }
        
        self.state = kPSModelWillLoad;
    }
    
    PSWeakify(self);
    PSDispatchAsyncOnBackgroundThread(^{
        PSStrongify(self);
        [self performLoading];
    });
}

- (void)performLoading {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark PSObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kPSModelWillLoad:
            return @selector(modelWillLoad:);
            
        case kPSModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        case kPSModelDidLoad:
            return @selector(modelDidLoad:);
            
        case kPSModelDidChange:
            return @selector(collection:didChangeWithModel:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
