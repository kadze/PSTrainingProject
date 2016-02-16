//
//  PSSquareView.m
//  IOSTrainingProject
//
//  Created by Сергей on 15.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSSquareView.h"
#import "PSMacros.h"

static const NSTimeInterval kPSDuration                 = 0.5;
static NSString * const kPSAnimateButtonNotMovedTitle   = @"Start";
static NSString * const kPSAnimateButtonMovedTitle      = @"Stop";

@interface PSSquareView ()
@property (nonatomic, assign)   BOOL    animationInProgress;

- (PSSquarePositionType)nextPositionForSquare;
- (void)changeTitleForAnimateButton;
- (CGRect)frameForSquarePosition:(PSSquarePositionType)squarePosition;

@end

@implementation PSSquareView

#pragma mark -
#pragma mark Accessors

- (void)setAnimating:(BOOL)animating {
    if (_animating != animating) {
        _animating = animating;
        
        [self animateSquare];
    }
}

- (void)setAnimationInProgress:(BOOL)animationInProgress {
    if (_animationInProgress != animationInProgress) {
        _animationInProgress = animationInProgress;
        
        [self changeTitleForAnimateButton];
    }
}

- (void)setSquarePosition:(PSSquarePositionType)position {
    [self setSquarePosition:position animated:NO];
}

- (void)setSquarePosition:(PSSquarePositionType)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(PSSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler
{
    NSTimeInterval duration = animated ? kPSDuration : 0;
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.squareView.frame = [self frameForSquarePosition:position];
                     }
                     completion:^(BOOL finished) {
                         _squarePosition = position;
                         
                         if (handler) {
                             handler(finished);
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (PSSquarePositionType)nextPositionForSquare {
    return arc4random_uniform(PSSquarePositionCount);
}

- (void)animateSquare {
    if (self.animating && !self.animationInProgress) {
        PSSquarePositionType position = [self nextPositionForSquare];
        self.animationInProgress = YES;
        PSWeakify(self);
        
        [self setSquarePosition:position animated:YES completionHandler:^(BOOL finished){
            PSStrongifyAndReturnIfNil(self);
            if (finished) {
                self.animationInProgress = NO;
                [self animateSquare];
            }
        }];
    }
}

- (void)changeTitleForAnimateButton {
    NSString *title = self.animating ? kPSAnimateButtonMovedTitle : kPSAnimateButtonNotMovedTitle;
    
    [self.animateButton setTitle:title forState:UIControlStateNormal];
}

- (CGRect)frameForSquarePosition:(PSSquarePositionType)squarePosition {
    CGRect result = self.squareView.frame;
    CGRect superviewBounds = self.superview.bounds;
    CGPoint point = CGPointZero;
    CGPoint max = CGPointMake(CGRectGetWidth(superviewBounds) - CGRectGetWidth(result),
                              CGRectGetHeight(superviewBounds) - CGRectGetHeight(result));
    
    switch (squarePosition) {
        case PSSquarePositionTopRight:
            point.x = max.x;
            break;
            
        case PSSquarePositionBottomLeft:
            point.y = max.y;
            break;
            
        case PSSquarePositionBottomRight:
            point = max;
            break;
            
        default:
            break;
    }
    
    result.origin = point;
    
    return result;
}

@end
