//
//  PSMethodReturn.c
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdio.h>
#include "PSMethodReturn.h"

const int PSParameterUndefined = 0;
const int PSParameterMom = 3;
const int PSParameterDad = 5;
const int PSNumberOfInspections = 1000;

void PSCheckParameters(void) {
    for (int namber = PSParameterUndefined; namber <= PSNumberOfInspections; namber++) {
        int currentNamber = namber;
        
        // Print current counter value
        printf("namber = %d ", currentNamber);
        
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
