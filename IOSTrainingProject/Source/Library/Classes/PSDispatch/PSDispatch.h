//
//  PSDispatch.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/14/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

void PSDispatchSyncOnMainThread(void(^block)(void));

void PSDispatchAsyncOnMainThread(void(^block)(void));

void PSDispatchAsyncOnBackgroundThread(void(^block)(void));
