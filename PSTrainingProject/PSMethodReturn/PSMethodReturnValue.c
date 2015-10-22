//
//  PSMethodReturn.c
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdio.h>
#include "PSMethodReturnNumber.h"

#pragma mark -
#pragma mark Public Inplementations

PSMethodReturnNumber PSIntegerOfValue(int value) {

    if (0 != value) {
        if (0 == value % kPSValueOfMom) {
            result = kLCHParentTypeMother;
            printf("Mother");
        }
        
        if (0 == value % kLCHFatherDivisor) {
            result = (kLCHParentTypeMother == result
                      ? kLCHParentTypeMotherFather
                      : kLCHParentTypeFather);
            
            printf("Father");
        }
        
        if (kLCHParentTypeUndefined != result) {
            printf("\n");
        }
    }
    
    return result;
}



void PSParentsType(void) {
    
    for (int namber = PSParameterUndefined; namber <= PSNumberOfInspections; namber++) {
        
        // Print current counter value
        printf("namber = %d ", namber);
        
        // Run function with current namber value in parameters
        if (PSParameterUndefined == namber) {
            printf("\n");
        } else {
            if (PSParameterUndefined == namber % PSParameterMom) {
                printf("Мама");
            }
            if (PSParameterUndefined == namber % PSParameterDad) {
                printf("Папа");
            }
            if (PSParameterUndefined != namber) {
                printf("\n");
            }
        }
    }
}
