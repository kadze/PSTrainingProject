//
//  PSMethodReturn.c
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdio.h>
#include "PSReturnMomOrDad.h"

#pragma mark -
#pragma mark Private Declarations

typedef enum {
    PSParameterUndefined,
    PSParameterMom = 3,
    PSParameterDad = 5,
    PSNumberOfInspections = 1000
} PSInputParameters;

#pragma mark -
#pragma mark Public Inplementations

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
