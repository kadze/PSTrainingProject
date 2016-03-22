//
//  PSUser.h
//  IOSTrainingProject
//
//  Created by Сергей on 22.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PSModel.h"
#import "PSImageModel.h"

@interface PSUser : NSObject <NSCoding>
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, readonly) PSImageModel    *imageModel;

@end
