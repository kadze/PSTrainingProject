//
//  UIWindow+PSExtensions.m
//  IOSTrainingProject
//
//  Created by Сергей on 11.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "UIWindow+PSExtensions.h"

@implementation UIWindow (PSExtensions)

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
