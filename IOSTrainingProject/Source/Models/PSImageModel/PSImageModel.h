//
//  PSImageModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/21/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSModel.h"

#import "PSCachedModel.h"

@interface PSImageModel : PSModel <PSCachedModel>
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageModelWithUrl:(NSURL *)url;

- (instancetype)initWithUrl:(NSURL *)url;

@end
