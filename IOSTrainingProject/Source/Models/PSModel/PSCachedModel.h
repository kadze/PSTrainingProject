//
//  PSCachedModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/24/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSCachedModel <NSObject>

@optional
@property (nonatomic, readonly)                     NSString    *fileName;
@property (nonatomic, readonly)                     NSString    *fileFolder;
@property (nonatomic, readonly)                     NSString    *filePath;
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;

- (void)save;

@end

