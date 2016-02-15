//
//  PSDispatch.h
//  PSTrainingProject
//
//  Created by Сергей on 10.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PSDispatchQueuePriority) {
    PSDispatchQueuePriorityBeckgraund   = (DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN),
    PSDispatchQueuePriorityLow          = (DISPATCH_QUEUE_PRIORITY_LOW, (-2)),
    PSDispatchQueuePriorityDefault      = (DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
    PSDispatchQueuePriorityHigh         = (DISPATCH_QUEUE_PRIORITY_HIGH, 2),
};

extern
void PSDispatchAsyncOnMainQueue(dispatch_block_t block);

extern
void PSDispatchSyncOnMainQueue(dispatch_block_t block);

extern
void PSDispatchAsyncOnDefaultQueue(dispatch_block_t block);

extern
void PSDispatchSyncOnDefaultQueue(dispatch_block_t block);
