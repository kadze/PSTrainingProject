//
//  PSAppDelegate.h
//  IOSTrainingProject
//
//  Created by Сергей on 03.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSUsers.h"

@interface PSAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong)   UIWindow    *window;
@property (nonatomic, strong)   PSUsers     *users;

@end
