//
//  PSArrayModelObserver.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PSModelObserver.h"

@protocol PSArrayModelObserver <NSObject, PSModelObserver>

@optional
- (void)collection:(id)collection didChangeWithModel:(id)changeModel;

@end
