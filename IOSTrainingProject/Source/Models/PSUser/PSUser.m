//
//  PSUser.m
//  IOSTrainingProject
//
//  Created by Сергей on 22.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUser.h"

#import "NSString+PSExtensions.h"

static NSUInteger const kPSRandomNameSize = 5;
static NSString * const kPSImageName = @"Apple_core";
static NSString * const kPSImageType = @"png";

@implementation PSUser

@dynamic image;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomStringFromSelfOfLength:kPSRandomNameSize];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
    static UIImage *__image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:kPSImageName ofType:kPSImageType];
        __image = [UIImage imageWithContentsOfFile:path];
    });
    
    return __image;
}

@end
