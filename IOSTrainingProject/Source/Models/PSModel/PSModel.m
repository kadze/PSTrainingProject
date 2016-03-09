//
//  PSModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/4/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSModel.h"

#import "PSModelObserver.h"

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
    
    [self performLoading];
}

- (void)performLoading {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark PSObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = nil;
    
    switch (state) {
        case kPSModelWillLoad:
            selector = @selector(modelWillLoad:);
            break;
            
        case kPSModelDidFailLoading:
            selector = @selector(modelDidFailLoading:);
            break;
            
        case kPSModelDidLoad:
            selector = @selector(modelDidLoad:);
            break;
            
        case kPSModelDidChange:
            selector = @selector(model:didChangeWithObject:);
            break;
            
        default:
            selector = [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
