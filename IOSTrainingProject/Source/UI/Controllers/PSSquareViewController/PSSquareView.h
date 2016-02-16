//
//  PSSquareView.h
//  IOSTrainingProject
//
//  Created by Сергей on 15.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PSSquarePositionType) {
    PSSquarePositionTopLeft,
    PSSquarePositionTopRight,
    PSSquarePositionBottomLeft,
    PSSquarePositionBottomRight,
    PSSquarePositionCount
};

@interface PSSquareView : UIView
@property (nonatomic, strong)   IBOutlet    UIView      *squareView;
@property (nonatomic, strong)   IBOutlet    UIButton    *animateButton;

@property (nonatomic, assign)   PSSquarePositionType    squarePosition;

@property (nonatomic, assign, getter=isAnimating)   BOOL    animating;


- (void)setSquarePosition:(PSSquarePositionType)position animated:(BOOL)animated;

- (void)setSquarePosition:(PSSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler;

@end
