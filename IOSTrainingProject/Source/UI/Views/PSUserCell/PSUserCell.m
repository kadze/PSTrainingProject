//
//  PSUserCell.m
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUserCell.h"

#import "PSUser.h"
#import "PSView.h"
#import "PSModel.h"

#import "PSDispatch.h"

@implementation PSUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.user = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(PSUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
        [self fillWithModel:user];
        [_user load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(PSUser *)user {
    self.label.text = user.name;
    self.userImageView.imageModel = user.image;
}

#pragma mark -
#pragma mark PSModelObserver

- (void)modelWillLoad:(id)model {
    PSDispatchAsyncOnMainThread(^{
        [self.loadingView showLoadingView];
    });
}

- (void)modelDidFailLoading:(id)model {
    [self.loadingView hideLoadingView];
}

- (void)modelDidLoad:(id)model {
    PSDispatchAsyncOnMainThread(^{
        [self fillWithModel:model];
        [self.loadingView hideLoadingView];
    });
}

@end
