//
//  PSUsers.h
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PSArray.h"

@class PSUser;

@interface PSUsers : PSArray
@property (nonatomic, readonly)                     NSString    *filePath;
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;

- (void)save;

@end
