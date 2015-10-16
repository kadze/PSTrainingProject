//
//  PSMethodReturnTest.c
//  PSTrainingProject
//
//  Created by Сергей on 13.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include "PSReturnMomOrDadTest.h"
#include "PSReturnMomOrDad.h"

#pragma mark -
#pragma mark Private Declarations

extern
void PSCheckParameterMom(void);

extern
void PSCheckParameterDad(void);

extern
void PSCheckParameterMomDad(void);

#pragma mark -
#pragma mark Public Implementations

void PSParentsTypeTest(void) {
    PSCheckParameterMom();
    PSCheckParameterDad();
    PSCheckParameterMomDad();
};

#pragma mark -
#pragma mark Private Implementations

