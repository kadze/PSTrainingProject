//
//  PSArray.c
//  PSTrainingProject
//
//  Created by Сергей on 10.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include "PSArray.h"

#pragma mark -
#pragma mark Initialization & Deallocation

void __PSArrayDeallocate(void *array) {
    __PSObjectDeallocate(array);
};

PSArray *PSArrayCreate(void) {
    PSArray *result = PSObjectCreateOfType(PSArray);
    
    return result;
};

#pragma mark -
#pragma mark Accessors



#pragma mark -
#pragma mark Public Implementations


void PSArrayAddObject(PSArray *array, void *object);

void PSArrayRemoveObjects(PSArray *array);

void *PSArrayAddElementAtIndex(PSArray *array, uint8_t objectIndex);

void PSArrayRemoveElementAtIndex(PSArray *array, uint8_t objectIndex);

uint8_t PSArrayObjectsCount(PSArray *array);