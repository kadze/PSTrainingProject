//
//  PSLoadingView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/9/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSLoadingView.h"

#import "UINib+PSExtensions.h"

static const NSTimeInterval kPSAnimateDuration    = 1.0;
static const CGFloat        kPSVisibleAlpha       = 1.0;

@interface PSLoadingView ()

- (void)animateWithVisibleState:(BOOL)state
                       duration:(NSUInteger)duration
              completionHandler:(void(^)(void))handler;

@end

@implementation PSLoadingView

#pragma mark -
#pragma mark Class methods

+ (instancetype)loadingViewWithSuperview:(UIView *)superview {
    PSLoadingView *view = [UINib objectWithClass:[self class]];
    view.alpha = 0;
    
    [superview addSubview:view];
    
    view.frame = superview.bounds;
    
    return view;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:YES];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated complition:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated complition:(void(^)(void))block {
    NSTimeInterval duration = animated ? kPSAnimateDuration : 0;
    
    [self animateWithVisibleState:visible duration:duration completionHandler:block];
}

#pragma mark -
#pragma mark Private

- (void)animateWithVisibleState:(BOOL)state
                       duration:(NSUInteger)duration
              completionHandler:(void(^)(void))handler
{
    [UIView animateWithDuration:duration
                     animations:^{
                         self.alpha = state ? kPSVisibleAlpha : 0;
                     }
                     completion:^(BOOL finished)
     {
         _visible = state;
         if (handler) {
             handler();
         }
     }];
}

@end
