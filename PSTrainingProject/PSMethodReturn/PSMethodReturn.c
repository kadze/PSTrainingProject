//
//  PSMethodReturn.c
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdio.h>
#include "PSMethodReturn.h"

typedef enum {
    PSParameterUndefined,
    PSParameterMom = 3,
    PSParameterEmpty,
    PSParameterDad,
    PSNumberOfInspections = PSParameterDad * PSParameterDad * PSParameterEmpty * (PSParameterDad + PSParameterDad)
} PSInputParameters;
    
void PSCheckParameters(void) {
    for (int namber = PSParameterUndefined; namber <= PSNumberOfInspections; namber++) {
        
        // Print current counter value
        printf("namber = %d ", namber);
        
        // Run function with current namber value in parameters
        if (0 == namber) {
            printf("\n");
        } else {
            if (0 == namber % PSParameterMom) {
                printf("Мама");
            }
            if (0 == namber % PSParameterDad) {
                printf("Папа");
            }
            if (0 != namber) {
                printf("\n");
            }
        }
    }
}
