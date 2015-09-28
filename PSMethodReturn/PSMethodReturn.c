//
//  PSMethodReturn.c
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include "PSMethodReturn.h"
#include "PSMethodReturnTest.h"

void PSCheckParameters(void) {
    for (int namber = PSParameterUndefined; namber < PSNumberOfInspections; namber++) {
        int currentNamber = namber;
        
        // Print current counter value
        printf("namber = %d ", currentNamber);
        
        // Run function with current namber value in parameters
        if (PSParameterUndefined != namber) {
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
