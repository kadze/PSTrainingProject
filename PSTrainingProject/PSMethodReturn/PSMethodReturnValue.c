//
//  PSMethodReturnValue.c
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdio.h>
#include "PSMethodReturnValue.h"
#include "PSMethodReturnValueTest.h"

#pragma mark -
#pragma mark Privat Declarations

const int kPSMultipleMom = 3;
const int kPSMultipleDad = 5;

#pragma mark -
#pragma mark Public Inplementations

PSMethodReturnValue PSIntegerOfValue(int value) {
    
    PSMethodReturnValue result = kPSValueOfUndefined;
    
    if (0 == value) {
        printf("\n");
    } else {
        if (0 == value % kPSMultipleMom) {
            result = kPSValueOfMom;
            printf("Мама");
        }
        if (0 == value % kPSMultipleDad) {
            result = (kPSValueOfMom == result ? kPSValueOfMomDad : kPSValueOfDad);
            printf("Папа");
        }

        printf("\n");
    }
    
    return result;
}
