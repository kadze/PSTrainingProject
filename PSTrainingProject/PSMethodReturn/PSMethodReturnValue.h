//
//  PSMethodReturnValue.h
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSMethodReturnValue_h
#define PSMethodReturnValue_h

#include <stdio.h>

typedef enum {
    kPSValueOfUndefined,
    kPSValueOfMom,
    kPSValueOfDad,
    kPSValueOfMomDad
} PSMethodReturnValue;

PSMethodReturnValue PSIntegerOfValue(int value);

#endif /* PSMethodReturn_h */
