//
//  PSObject.c
//  PSTrainingProject
//
//  Created by Сергей on 26.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdlib.h>
#include <assert.h>
#include "PSObject.h"

void *__PSObjectCreate(size_t size, PSObjectDeallocator deallocator) {
    assert(0 != size);
    assert(NULL != deallocator);
    
    PSObject *object = calloc(1, size);
    
    assert(NULL != object);
    
    object->_retainCount = 1;
    object->_deallocatorFunctionPointer = deallocator;
    
    return object;
}

void __PSObjectDeallocate(void *object) {
    if (NULL != object) {
        free(object);
    }
}

uint64_t PSObjectRetainCount(void *object) {
    return object ? ((PSObject *)object)->_retainCount : 0;
}

void PSObjectRelease(void *object) {
    if (NULL != object) {
        PSObject *releasedObject = (PSObject *)object;
        
        if (0 == --(releasedObject->_retainCount)) {
            PSObjectDeallocator deallocator = releasedObject->_deallocatorFunctionPointer;
            
            deallocator(object);
        }
    }
}

void *PSObjectRetain(void *object) {
    if (NULL != object) {
        ((PSObject *)object)->_retainCount++;
    }
    
    return object;
}