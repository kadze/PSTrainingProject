//
//  PSImageView.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/18/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSView.h"
#import "PSImageModel.h"

#import "PSModelObserver.h"

@interface PSImageView : PSView <PSModelObserver>
@property (nonatomic, strong)   PSImageModel    *imageModel;

@end
