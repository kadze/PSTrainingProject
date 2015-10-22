//
//  PSHuman.c
//  PSTrainingProject
//
//  Created by Сергей on 05.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>
#include "PSHuman.h"

#pragma mark -
#pragma mark Private Decloration

const int PSChildrenCount = 20;
const int PSBeginningAge  = 1;
const int PSLegalAge      = 18;
const int PSAgeMax        = 100;

typedef enum {
    PSHumanGenderMale,
    PSHumanGenderFemale
} PSHumanGender;

struct PSHuman {
    char *_name;
    PSHuman *_partner;
    PSHuman *_father;
    PSHuman *_mother;
    PSHuman *_children[PSChildrenCount];
    PSHumanGender _gender;
    int _age;
    uint64_t _referenceCount;
};

#pragma mark -
#pragma mark Private Implementations

void PSObjectRetain(PSHuman *object) {
    if (object) {
        object->_referenceCount++;
    }
}

void PSObjectRelease(PSHuman *object) {
    if (NULL != object) {
        if (0 == --(object->_referenceCount)) {
            PSHumanDeallocate(object);
        }
    }
}

#pragma mark -
#pragma mark Public Implementations
            
PSHuman *PSHumanCreate(void) {
    PSHuman *object = malloc(sizeof(PSHuman));
    assert(object != NULL);
    return object;
};

void PSHumanDeallocate(PSHuman *object) {
    free(object);
};

char *PSHumanName(PSHuman *object) {
    return NULL != object ? object->_name : NULL;
}

void PSHumanSetName(PSHuman *object, char *name) {
    if (NULL != object) {
        if (NULL != object->_name) {
            free(object->_name);
            object->_name = NULL;
        }
        
        if (name) {
            object->_name = strdup(name);
        }
    }
}

int PSHumanAge(PSHuman *object) {
    return NULL != object ? object->_age : 0;
}

void PSHumanSetAge(PSHuman *object, int *_age) {
    if (NULL != object) {
        if (age > object->_age && age <= PSAgeMax ? age : PSAgeMax) {
            object->_age = *age;
        }
    }
}

int PSHumanChildrenCount(PSHuman *object) {
    return NULL != object ? object->_children : 0;
}

PSHuman *PSHumanPartner(PSHuman *object) {
    return NULL != object ? object->_partner : NULL;
}

void PSHumanSetPartner(PSHuman *object, PSHuman *partner) {
    if (NULL != object) {
        PSObjectRelease(object->_partner);
        object->_partner = partner;
        PSObjectRetain(partner);
    }
}

PSHuman *PSHumanFather(PSHuman *object) {
    return NULL != object ? object->_father : NULL;
}

void PSHumanSetFather(PSHuman *object, PSHuman *_father) {
    if (NULL != object) {
        object->_father = father;
    }
}

PSHuman *PSHumanMother(PSHuman *object) {
    return NULL != object ? object->_mother : NULL;
}

void PSHumanSetMother(PSHuman *object, PSHuman *_mother) {
    if (NULL != object) {
        object->_mother = mother;
    }
}

PSHuman *PSHumanGender(PSHuman *object) {
    return NULL != object ? object->_gender : 0;
}

void PSHumanSetGender(PSHuman *object, PSHumanGender _gender) {
    if (NULL != object) {
        object->_gender = gender;
    }
}
