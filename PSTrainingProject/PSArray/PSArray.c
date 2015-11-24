////
////  PSArray.c
////  PSTrainingProject
////
////  Created by Сергей on 10.11.15.
////  Copyright © 2015 Сергей. All rights reserved.
////
//
//#include "PSArray.h"
//
//#pragma mark -
//#pragma mark Private Declarations
//
//static
//void PSArraySetCapacity(PSArray *array, uint64_t capacity);
//
//#pragma mark -
//#pragma mark Initialization & Deallocation
//
//void __PSArrayDeallocate(void *object) {
//    PSArrayRemoveAllObjects(object);
//    PSArraySetCapacity(object, 0);
//    
//    __PSObjectDeallocate(object);
//};
//
//void *PSArrayCreateCapacity(uint64_t capacity) {
//    PSArray *result = PSObjectCreateOfType(PSArray);
//    PSArraySetCapacity(result, capacity);
//    
//    return result;
//};
//
//#pragma mark -
//#pragma mark Accessors
//
//
//
//#pragma mark -
//#pragma mark Public Implementations
//
//
//void PSArrayAddObject(PSArray *array, void *object);
//
//uint64_t PSArrayGetCount(PSArray *array);
//
//bool PSArrayContainsObject(PSArray *array, void *object);
//
//uint64_t PSArrayGetIndexAtObject(PSArray *array, void *object);
//
//void *PSArrayGetObjectAtIndex(PSArray *array, uint64_t index);
//
//void *PSArrayRemoveObjectAtIndex(PSArray *array, uint64_t index);
//
//void PSArrayRemoveAllObjects(PSArray *array);