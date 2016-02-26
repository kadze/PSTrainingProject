//
//  PSBlockCallMacros.h
//  IOSTrainingProject
//
//  Created by Сергей on 2/25/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#ifndef BlockCallMacros_h
#define BlockCallMacros_h

#define __PSBlockCall(block, ...) \
    do { \
        typeof(block) var = block; \
        if (var) { \
            var(__VA_ARGS__); \
        } \
    } while(0)

#define PSBlockCall(...) __PSBlockCall(__VA_ARGS__)

#endif /* BlockCallMacros_h */
