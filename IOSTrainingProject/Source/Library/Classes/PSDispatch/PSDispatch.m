//
//  PSDispatch.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/14/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSDispatch.h"

void PSDispatchSyncOnMainThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void PSDispatchAsyncOnMainThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), block);
}

void PSDispatchAsyncOnBackgroundThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}
