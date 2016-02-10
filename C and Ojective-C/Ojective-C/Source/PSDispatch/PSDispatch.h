//
//  PSDispatch.h
//  PSTrainingProject
//
//  Created by Сергей on 10.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
void PSDispatchAsyncOnMainQueue(dispatch_block_t block);

extern
void PSDispatchAsyncOnDefaultQueue(dispatch_block_t block);

extern
void PSDispatchSyncOnDefaultQueue(dispatch_block_t block);
