//
//  NSFileManager+PSExtensions.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/22/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "NSFileManager+PSExtensions.h"

@implementation NSFileManager (PSExtensions)

+ (NSString *)userDocumentsPath {
    return [self pathWithSearchPathDirectory:NSDocumentDirectory];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)directory {
    return [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) firstObject];
}

@end
