//
//  PSDispatch.m
//  PSTrainingProject
//
//  Created by Сергей on 10.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSDispatch.h"

#pragma mark -
#pragma mark Private Declarations

dispatch_queue_t getDefaultQueue(void);

#pragma mark -
#pragma mark Public Implementations

void PSDispatchAsyncOnMainQueue(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void PSDispatchAsyncOnDefaultQueue(dispatch_block_t block) {
    dispatch_async(getDefaultQueue(), block);
}

void PSDispatchSyncOnDefaultQueue(dispatch_block_t block) {
    dispatch_sync(getDefaultQueue(), block);
}

#pragma mark-
#pragma mark Private Implementations

dispatch_queue_t getDefaultQueue(void) {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}
