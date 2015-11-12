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
#include "PSObject.h"

static const int kPSChildrenCount = 20;

typedef struct {
    PSObject _supper;
    void *_array[kPSChildrenCount];
} PSArray;

extern
void __PSArrayDeallocate(void *array);

extern
PSArray *PSArrayCreate(void);

extern
void PSArrayAddObject(PSArray *array, void *object);

extern
void PSArrayRemoveObjects(PSArray *array);

extern
void *PSArrayAddElementAtIndex(PSArray *array, uint8_t objectIndex);

extern
void PSArrayRemoveElementAtIndex(PSArray *array, uint8_t objectIndex);

extern
uint8_t PSArrayObjectsCount(PSArray *array);

#endif /* PSArray_h */
