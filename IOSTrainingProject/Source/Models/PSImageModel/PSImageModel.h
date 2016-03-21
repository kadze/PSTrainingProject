//
//  PSImageModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/21/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSModel.h"

@interface PSImageModel : PSModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

@end
