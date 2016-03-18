//
//  PSImageView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/18/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSImageView.h"

#import "PSUser.h"
#import "PSModel.h"

@implementation PSImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.imageModel = nil;
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(PSUser *)user {
    self.imageModel.image = user.image;
}



@end
