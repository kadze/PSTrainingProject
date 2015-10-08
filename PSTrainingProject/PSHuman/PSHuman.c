//
//  PSHuman.c
//  PSTrainingProject
//
//  Created by Сергей on 05.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include "PSHuman.h"

PSHuman *PSHumanCreate(void) {
    PSHuman *human = malloc(sizeof(PSHuman));
    assert(human != NULL);
    return human;
};

void PSHumanDeallocate(PSHuman *human) {
    free(human);
};

extern
char *PSHumanName(PSHuman *human);

extern
void PSHumanSetName(PSHuman *human, char *_name);

extern
int PSHumanAge(PSHuman *human);

extern
void PSHumanSetAge(PSHuman *human, int *_age);

extern
int PSHumanChildrenCount(PSHuman *human);

extern
PSHuman *PSHumanPartnet(PSHuman *human);

extern
void PSHumanSetPartnet(PSHuman *human, PSHuman *_partner);

extern
PSHuman *PSHumanFather(PSHuman *human);

extern
void PSHumanSetFather(PSHuman *human, PSHuman *_father);

extern
PSHuman *PSHumanMother(PSHuman *human);

extern
void PSHumanSetMother(PSHuman *human, PSHuman *_Mother);