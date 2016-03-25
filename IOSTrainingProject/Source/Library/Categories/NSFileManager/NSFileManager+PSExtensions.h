//
//  NSFileManager+PSExtensions.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/22/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (PSExtensions)

+ (NSString *)userDocumentsPath;

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)directory;

@end
