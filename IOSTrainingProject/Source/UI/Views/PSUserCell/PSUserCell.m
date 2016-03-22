//
//  PSUserCell.m
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUserCell.h"

#import "PSUser.h"
#import "PSImageView.h"
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
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(PSUser *)user {
    self.label.text = user.name;
    self.userImageView.imageModel = user.imageModel;
}

@end
