//
//  PSImageView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/18/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSImageView.h"


@implementation PSImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.imageModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(PSImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        _imageModel = imageModel;
        [_imageModel addObserver:self];
        [self fillWithModel:imageModel];
        [_imageModel load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(PSImageModel *)model {
    self.imageModel.image = model.image;
}

@end
