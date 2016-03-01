//
//  PSUser.h
//  IOSTrainingProject
//
//  Created by Сергей on 22.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PSObservableObject.h"

@interface PSUser : PSObservableObject
@property (nonatomic, copy)     NSString  *name;
@property (nonatomic, readonly) UIImage   *image;

@end
