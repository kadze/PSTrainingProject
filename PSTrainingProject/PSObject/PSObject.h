//
//  PSObject.h
//  PSTrainingProject
//
//  Created by Сергей on 26.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSObject_h
#define PSObject_h

#include <stdio.h>

typedef void (*PSObjectDeallocator)(void *object);

typedef struct {
    uint64_t _retainCount;
    PSObjectDeallocator _deallocatorFunctionPointer;
    
} PSObject;

#define PSObjectCreateOfType(type) __PSObjectCreate(sizeof(type))

extern
void *__PSObjectCreate(size_t size, PSObjectDeallocator deallocator);

extern
void __PSObjectDeallocate(void *object);

extern
uint64_t PSObjectRetainCount(void *object);

extern
void PSObjectRelease(void *object);

extern
void *PSObjectRetain(void *object);


#endif /* PSObject_h */
