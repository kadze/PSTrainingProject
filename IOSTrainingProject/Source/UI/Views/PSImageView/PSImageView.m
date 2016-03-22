//
//  PSImageView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/18/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSImageView.h"

#import "PSDispatch.h"

@interface PSImageView ()
@property (nonatomic, strong)   UIImageView *imageView;

- (void)fillWithModel:(PSImageModel *)model;

@end

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
#pragma mark PSModelObserver

- (void)modelWillLoad:(id)model {
    PSDispatchAsyncOnMainThread(^{
        [self showLoadingView];
    });
}

- (void)modelDidFailLoading:(id)model {
    [self hideLoadingView];
}

- (void)modelDidLoad:(id)model {
    PSDispatchAsyncOnMainThread(^{
        [self fillWithModel:model];
        [self hideLoadingView];
    });
}

#pragma mark -
#pragma mark Privat

- (void)fillWithModel:(PSImageModel *)model {
    self.imageView.image = model.image;
}

@end
