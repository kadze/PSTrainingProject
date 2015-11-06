//
//  PSHuman.h
//  PSTrainingProject
//
//  Created by Сергей on 05.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSHuman_h
#define PSHuman_h

#include "PSString.h"

typedef struct PSHuman PSHuman;

typedef enum {
    kPSHumanGenderMale,
    kPSHumanGenderFemale
} PSHumanGenderType;

extern
PSHuman *PSHumanCreate(void);

extern
void __PSHumanDeallocate(void *object);

extern
PSString *PSHumanName(PSHuman *object);

extern
void PSHumanSetName(PSHuman *object, PSString *string);

extern
int PSHumanAge(PSHuman *object);

extern
void PSHumanSetAge(PSHuman *object, uint8_t age);

extern
int PSHumanChildrenCount(PSHuman *object);

extern
PSHuman *PSHumanPartner(PSHuman *object);

extern
void PSHumanSetPartner(PSHuman *object, PSHuman *_partner);

extern
PSHuman *PSHumanFather(PSHuman *object);

extern
void PSHumanSetFather(PSHuman *object, PSHuman *_father);

extern
PSHuman *PSHumanMother(PSHuman *object);

extern
void PSHumanSetMother(PSHuman *object, PSHuman *_mother);

extern
PSHumanGenderType *PSHumanGetGender(PSHuman *object);

extern
void PSHumanSetGender(PSHuman *object, PSHumanGenderType gender);

#endif /* PSHuman_h */
