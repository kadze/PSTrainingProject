//
//  PSSquareView.m
//  IOSTrainingProject
//
//  Created by Сергей on 15.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSSquareView.h"

#import "CGGeometry+PSExtensions.h"
#import "PSWeakifyMacros.h"
#import "PSReturnMacros.h"
#import "PSPragmaMacros.h"

static const NSTimeInterval kPSDuration                 = 0.5;

static NSString * const kPSAnimateButtonNotMovedTitle   = @"Start";
static NSString * const kPSAnimateButtonMovedTitle      = @"Stop";

@interface PSSquareView ()
@property (nonatomic, assign)   BOOL    positionStartStopButton;

- (PSSquarePositionType)nextPositionForSquare;
- (void)changeTitleStartStopButton;
- (CGRect)frameForSquarePosition:(PSSquarePositionType)squarePosition;

@end

@implementation PSSquareView

#pragma mark -
#pragma mark Accessors

- (void)setAnimation:(BOOL)animation {
    if (_animation != animation) {
        _animation = animation;
        
        [self animateSquare];
    }
}

- (void)setPositionStartStopButton:(BOOL)positionStartStopButton {
    if (_positionStartStopButton != positionStartStopButton) {
        _positionStartStopButton = positionStartStopButton;
        
        [self changeTitleStartStopButton];
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
                         self.squareLabel.frame = [self frameForSquarePosition:position];
                     }
                     completion:^(BOOL finished) {
                             _squarePosition = position;
                         
                         if (handler) {
                             handler(finished);
                         }
                     }];
}

#pragma mark -
#pragma mark Public

- (void)moveSquareToNextPosition {
    if (!self.positionStartStopButton) {
        [self setSquarePosition:[self nextPositionForSquare] animated:YES];
    }
}

#pragma mark -
#pragma mark Private

- (PSSquarePositionType)nextPositionForSquare {
    return (self.squarePosition + 1) % PSSquarePositionCount;
}

- (void)animateSquare {
    if (self.animation && !self.positionStartStopButton) {
        PSSquarePositionType position = [self nextPositionForSquare];
        self.positionStartStopButton = YES;
        PSWeakify(self);
        
        [self setSquarePosition:position animated:YES completionHandler:^(BOOL finished){
            PSStrongifyAndReturnIfNil(self);
            if (finished) {
                self.positionStartStopButton = NO;
                [self animateSquare];
            }
        }];
    }
}

- (void)changeTitleStartStopButton {
    NSString *title = self.animation ? kPSAnimateButtonMovedTitle : kPSAnimateButtonNotMovedTitle;
    
    [self.startStopButton setTitle:title forState:UIControlStateNormal];
}

- (CGRect)frameForSquarePosition:(PSSquarePositionType)squarePosition {
    CGRect result = self.squareLabel.frame;
    CGRect superviewBounds = self.areaView.bounds;
    CGPoint point = CGPointZero;
    CGPoint max = PSPointBySubtractingRects(superviewBounds, result);
    
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
