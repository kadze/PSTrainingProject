//
//  PSDataStructure.h
//  PSTrainingProject
//
//  Created by Сергей on 22.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSDataStructure_h
#define PSDataStructure_h

#include <stdio.h>
#include <stdbool.h>

typedef struct {
    bool bool1;
    float floatValue;
    bool bool2;
    short shortValue1;
    int integerValue;
    bool bool3;
    long long longLongValue;
    short shortValue2;
    bool bool4;
    double doubleValue;
    bool bool5;
    short shortValue3;
    char *string;
    bool bool6;
} PSDataRandomly;

typedef struct {
    char *string;
    long long longLongValue;
    double doubleValue;
    float floatValue;
    int integerValue;
    short shortValue1;
    short shortValue2;
    short shortValue3;
    bool bool1;
    bool bool2;
    bool bool3;
    bool bool4;
    bool bool5;
    bool bool6;
} PSOptimizedData;

typedef struct {
    char *string;
    long long longLongValue;
    double doubleValue;
    float floatValue;
    int integerValue;
    short shortValue1;
    short shortValue2;
    short shortValue3;
    union {
        struct {
            bool bool1: 1;
            bool bool2: 1;
            bool bool3: 1;
            bool bool4: 1;
            bool bool5: 1;
            bool bool6: 1;
        } unionStructure;
    };
} PSOptimizedUnion;

#endif /* PSDataStructure_h */
