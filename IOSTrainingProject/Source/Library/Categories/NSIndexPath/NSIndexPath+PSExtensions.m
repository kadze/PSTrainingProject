//
//  NSIndexPath+PSExtensions.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSIndexPath+PSExtensions.h"

@implementation NSIndexPath (PSExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)indexPathForRow:(NSUInteger)row {
    return [self indexPathForRow:row inSection:0];
}

@end
