//
//  PSMethodReturnValueTest.c
//  PSTrainingProject
//
//  Created by Сергей on 13.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <assert.h>
#include "PSMethodReturnValueTest.h"
#include "PSMethodReturnValue.h"

#pragma mark -
#pragma mark Private Declarations

static const int kPSNumberOfIterations = 1000;

extern
void PSReturnValueMomTest(void);

extern
void PSReturnValueDadTest(void);

extern
void PSReturnValueMomDadTest(void);

extern
void PSCyclicCheck(void);

#pragma mark -
#pragma mark Private Implementations

void PSPMethodReturnValueTest(void) {
    PSReturnValueMomTest();
    PSReturnValueDadTest();
    PSReturnValueMomDadTest();
    PSCyclicCheck();
};

// Function must return value of Mom otherwise crash program
void PSReturnValueMomTest(void) {
    int result = PSIntegerOfValue(3);
    
    assert(result == kPSValueOfMom);
}

// Function must return value of Dad otherwise crash program
void PSReturnValueDadTest(void) {
    int result = PSIntegerOfValue(5);
    
    assert(result == kPSValueOfDad);
}

// Function must return value of Mom and Dad otherwise crash program
void PSReturnValueMomDadTest(void) {
    int result = PSIntegerOfValue(15);
    
    assert(result == kPSValueOfMomDad);
}

// Cycle in accordance with a predetermined number of iterations
void PSCyclicCheck(void) {
    for (int count = 0; count <= kPSNumberOfIterations; count++) {
        int currentCount = count;
        printf("number iterations = %d\t", currentCount);
        PSIntegerOfValue(currentCount);
    }
}