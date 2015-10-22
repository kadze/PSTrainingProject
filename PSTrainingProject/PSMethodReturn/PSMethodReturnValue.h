//
//  PSMethodReturnNumber.h
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSMethodReturnNumber_h
#define PSMethodReturnNumber_h

#include <stdio.h>

typedef enum {
    kPSValueOfUndefined,
    kPSValueOfMom = 3,
    kPSValueOfDad = 5,
    kPSValueOfInspections = 1000
} PSMethodReturnNumber;

extern
PSMethodReturnNumber PSIntegerOfValue(int value);

#endif /* PSMethodReturn_h */
