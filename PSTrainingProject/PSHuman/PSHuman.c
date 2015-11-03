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
#include "PSObject.h"

#pragma mark -
#pragma mark Private Decloration

static const int kPSChildrenCount = 20;

struct PSHuman {
    PSObject _super;
    char *_name;
    PSHuman *_partner;
    PSHuman *_father;
    PSHuman *_mother;
    PSHuman *_children[kPSChildrenCount];
    PSHumanGender _gender;
    uint8_t _age;
};

#pragma mark -
#pragma mark Public Implementations

void PSHumanDeallocate(void *object) {
    PSHumanSetName(object, NULL);
    PSHumanSetPartner(object, NULL);
    
    __PSObjectDeallocate(object);
};

PSHuman *PSHumanCreate(void) {
    PSHuman *result = PSObjectCreateOfType(PSHuman);
    return result;
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

void PSHumanSetAge(PSHuman *object, uint8_t age) {
    if (NULL != object && 0 == object->_age) {
        object->_age = age;
    }
}

int PSHumanChildrenCount(PSHuman *object) {
    uint8_t childrenCount = 0;
    if (NULL != object) {
        for (int childrenIndex = 0; childrenIndex < kPSChildrenCount; childrenIndex++) {
            if (object->_children[childrenIndex] != NULL) {
                childrenCount++;
            }
        }
    }
    
    return childrenCount;
}

PSHuman *PSHumanPartner(PSHuman *object) {
    return NULL != object ? object->_partner : NULL;
}

void PSHumanSetPartner(PSHuman *object, PSHuman *partner) {
    if (NULL != object && object->_partner != partner) {
        PSObjectRelease(object->_partner);
        object->_partner = partner;
        PSObjectRetain(partner);
    }
}

PSHuman *PSHumanFather(PSHuman *object) {
    return NULL != object ? object->_father : NULL;
}

void PSHumanSetFather(PSHuman *object, PSHuman *father) {
    if (NULL != object) {
        object->_father = father;
    }
}

PSHuman *PSHumanMother(PSHuman *object) {
    return NULL != object ? object->_mother : NULL;
}

void PSHumanSetMother(PSHuman *object, PSHuman *mother) {
    if (NULL != object) {
        object->_mother = mother;
    }
}

PSHumanGender *PSHumanGetGender(PSHuman *object) {
    return NULL != object ? object->_gender : 0;
}

void PSHumanSetGender(PSHuman *object, PSHumanGender gender) {
    if (NULL != object) {
        object->_gender = gender;
    }
}
