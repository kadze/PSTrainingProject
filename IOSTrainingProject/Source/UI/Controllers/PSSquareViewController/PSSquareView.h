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
    PSSquarePositionBottomRight,
    PSSquarePositionBottomLeft,
    PSSquarePositionCount
};

@interface PSSquareView : UIView
@property (nonatomic, strong)   IBOutlet    UIView      *areaView;
@property (nonatomic, strong)   IBOutlet    UILabel     *squareLabel;
@property (nonatomic, strong)   IBOutlet    UIButton    *startStopButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *moveButton;

@property (nonatomic, assign)   PSSquarePositionType    squarePosition;

@property (nonatomic, assign)   BOOL    animation;


- (void)setSquarePosition:(PSSquarePositionType)position animated:(BOOL)animated;

- (void)setSquarePosition:(PSSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler;

- (void)moveSquareToNextPosition;

@end
