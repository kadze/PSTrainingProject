//
//  PSView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/9/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSView.h"

#import "PSLoadingView.h"

#import "PSWeakifyMacros.h"

@interface PSView ()
@property (nonatomic, strong)   PSLoadingView   *loadingView;

@end

@implementation PSView

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Accessors

- (BOOL)isLoadingViewVisible {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark Public

- (id)newLoadingView {
    return [PSLoadingView loadingViewWithSuperview:self];
}

- (void)showLoadingView {
    [self connectLoadingView];
    
    [self bringSubviewToFront:self.loadingView];
    self.loadingView.visible = YES;
}

- (void)hideLoadingView {
    PSWeakify(self);
    [self.loadingView setVisible:NO animated:YES complition:^{
        PSStrongifyAndReturnIfNil(self);
        self.loadingView = nil;
    }];
}

#pragma mark -
#pragma mark Private

- (void)connectLoadingView {
    self.loadingView = [self newLoadingView];
}

@end
