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
void __PSHumanDeallocate(void *human);

extern
PSString *PSHumanName(PSHuman *human);

extern
void PSHumanSetName(PSHuman *human, PSString *string);

extern
int PSHumanAge(PSHuman *human);

extern
void PSHumanSetAge(PSHuman *human, uint8_t age);

extern
int PSHumanChildrenCount(PSHuman *human);

extern
PSHuman *PSHumanPartner(PSHuman *human);

extern
void PSHumanSetPartner(PSHuman *human, PSHuman *_partner);

extern
PSHuman *PSHumanFather(PSHuman *human);

extern
void PSHumanSetFather(PSHuman *human, PSHuman *_father);

extern
PSHuman *PSHumanMother(PSHuman *human);

extern
void PSHumanSetMother(PSHuman *human, PSHuman *_mother);

extern
PSHumanGenderType PSHumanGender(PSHuman *human);

extern
void PSHumanSetGender(PSHuman *human, PSHumanGenderType gender);

#endif /* PSHuman_h */
