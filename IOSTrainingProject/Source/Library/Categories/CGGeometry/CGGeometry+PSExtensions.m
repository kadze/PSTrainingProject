//
//  CGGeometry+PSExtensions.m
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "CGGeometry+PSExtensions.h"

CGPoint PSPointBySubtractingRects(CGRect minuend, CGRect subtrahend) {
    return CGPointMake(CGRectGetMaxX(minuend) - CGRectGetWidth(subtrahend),
                       CGRectGetMaxY(minuend) - CGRectGetHeight(subtrahend));
}
