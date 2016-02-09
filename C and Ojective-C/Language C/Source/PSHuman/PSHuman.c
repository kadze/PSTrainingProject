//
//  PSHuman.c
//  PSTrainingProject
//
//  Created by Сергей on 05.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "PSHuman.h"
#include "PSObject.h"
#include "PSString.h"

#pragma mark -
#pragma mark Private Decloration

static const int kPSChildrenCount = 20;

struct PSHuman {
    PSObject _super;
    PSString *_name;
    PSHuman *_partner;
    PSHuman *_father;
    PSHuman *_mother;
    PSHuman *_children[kPSChildrenCount];
    PSHumanGenderType _gender;
    uint8_t _age;
};

extern
void PSHunanMerry(PSHuman *human);

extern
void PSHumanDivorce(PSHuman *human, PSHuman *partner);

#pragma mark -
#pragma mark Initialization & Deallocations

void __PSHumanDeallocate(void *human) {
    PSHumanSetName(human, NULL);
    PSHumanSetPartner(human, NULL);
    PSHumanSetFather(human, NULL);
    PSHumanSetMother(human, NULL);
    
    __PSObjectDeallocate(human);
};

PSHuman *PSHumanCreate(void) {
    PSHuman *result = PSObjectCreateOfType(PSHuman);
    
    return result;
};

#pragma mark -
#pragma mark Accessors

PSString *PSHumanName(PSHuman *human) {
    return NULL != human ? human->_name : NULL;
}

void PSHumanSetName(PSHuman *human, PSString *string) {
    if (NULL != human && human->_name != string) {
        PSObjectRelease(human->_name);
        human->_name = PSObjectRetain(string);
    }
}

int PSHumanAge(PSHuman *human) {
    return NULL != human ? human->_age : 0;
}

void PSHumanSetAge(PSHuman *human, uint8_t age) {
    if (NULL != human) {
        human->_age = age;
    }
}

int PSHumanChildrenCount(PSHuman *human) {
    uint8_t childrenCount = 0;
    if (NULL != human) {
        for (int index = 0; index < kPSChildrenCount; index++) {
            if (human->_children[index] != NULL) {
                childrenCount++;
            }
        }
    }
    
    return childrenCount;
}

PSHuman *PSHumanPartner(PSHuman *human) {
    return NULL != human ? human->_partner : NULL;
}

void PSHumanSetPartner(PSHuman *human, PSHuman *partner) {
    if (NULL != human && human->_partner != partner) {
        PSObjectRelease(human->_partner);
        human->_partner = PSObjectRetain(partner);
    }
}

PSHuman *PSHumanFather(PSHuman *human) {
    return NULL != human ? human->_father : NULL;
}

void PSHumanSetFather(PSHuman *human, PSHuman *father) {
    if (NULL != human) {
        human->_father = father;
    }
}

PSHuman *PSHumanMother(PSHuman *human) {
    return NULL != human ? human->_mother : NULL;
}

void PSHumanSetMother(PSHuman *human, PSHuman *mother) {
    if (NULL != human) {
        human->_mother = mother;
    }
}

PSHumanGenderType PSHumanGender(PSHuman *human) {
    return NULL != human ? human->_gender : 0;
}

void PSHumanSetGender(PSHuman *human, PSHumanGenderType gender) {
    if (NULL != human) {
        human->_gender = gender;
    }
}

#pragma mark -
#pragma mark Public Implementation

void PSHumanDivorce(PSHuman *human, PSHuman *partner) {
    if (NULL != human && NULL != partner
                        && PSHumanGender(human) != PSHumanGender(partner)
                        && partner != PSHumanPartner(human)) {
        PSObjectRetain(human);
        
    }
};

void PSHunanMerry(PSHuman *human);
