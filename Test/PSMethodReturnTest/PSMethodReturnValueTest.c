//
//  PSMethodReturnNumberTest.c
//  PSTrainingProject
//
//  Created by Сергей on 13.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include "PSMethodReturnNumberTest.h"
#include "PSMethodReturnNumber.h"

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

//function must return type Mom otherwise program crashes
void PSCheckParameterMom(void) {
    int result = PSPerformParentType(3);

    assert(result == kLCHParentTypeMother);
}

// LCHCheckParentType function must return kLCHParentTypeFather
void LCHCheckParentTypeFather(void) {
    int result = LCHPerformParentType(5);
    
    // If not, program will crash here
    assert(result == kLCHParentTypeFather);
}

// LCHCheckParentType function must return kLCHParentTypeMotherFather
void LCHCheckParentTypeMotherFather(void) {
    int result = LCHPerformParentType(15);
    
    // If not, program will crash here
    assert(result == kLCHParentTypeMotherFather);
}
