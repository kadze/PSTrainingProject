//
//  PSArray.h
//  PSTrainingProject
//
//  Created by Сергей on 10.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSArray_h
#define PSArray_h

#include <stdio.h>
#include <stdbool.h>
#include "PSObject.h"

static const uint64_t kPSArrayLimit = UINT64_MAX;

typedef struct {
    PSObject _supper;
    void **_data;
    uint64_t _count;
    uint64_t _capacity;
} PSArray;

extern
void __PSArrayDeallocate(void *object);

extern
void *PSArrayCreateCapacity(uint64_t capacity);

extern
void PSArrayAddObject(PSArray *array, void *object);

extern
uint64_t PSArrayGetCount(PSArray *array);

extern
bool PSArrayContainsObject(PSArray *array, void *object);

extern
uint64_t PSArrayGetIndexAtObject(PSArray *array, void *object);

extern
void *PSArrayGetObjectAtIndex(PSArray *array, uint64_t index);

extern
void *PSArrayRemoveObjectAtIndex(PSArray *array, uint64_t index);

extern
void PSArrayRemoveAllObjects(PSArray *array);

#endif /* PSArray_h */
