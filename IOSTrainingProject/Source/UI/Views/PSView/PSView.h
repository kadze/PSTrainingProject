//
//  PSView.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/9/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSView : UIView
@property (nonatomic, readonly, getter=isLoadingViewVisible)    BOOL    loadingViewVisible;

- (id)newLoadingView;

- (void)showLoadingView;
- (void)hideLoadingView;

@end
