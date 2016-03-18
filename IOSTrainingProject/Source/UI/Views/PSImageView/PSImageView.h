//
//  PSImageView.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/18/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSModelObserver.h"

@interface PSImageView : UIView <PSModelObserver>
@property (nonatomic, strong)   IBOutlet    UIImageView *imageModel;

@end
