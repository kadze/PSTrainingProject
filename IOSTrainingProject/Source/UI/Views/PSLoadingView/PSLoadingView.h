//
//  PSLoadingView.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/9/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSLoadingView : UIView
@property (nonatomic, getter=isVisible) BOOL    visible;

+ (instancetype)loadingViewWithSuperview:(UIView *)superview;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated complition:(void(^)(void))block;

@end
