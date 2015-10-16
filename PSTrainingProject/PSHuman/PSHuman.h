//
//  PSHuman.h
//  PSTrainingProject
//
//  Created by Сергей on 05.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSHuman_h
#define PSHuman_h

typedef struct PSHuman PSHuman;

extern
PSHuman *PSHumanCreate(void);

extern
void PSHumanDeallocate(PSHuman *object);

extern
char *PSHumanName(PSHuman *object);

extern
void PSHumanSetName(PSHuman *object, char *_name);

extern
int PSHumanAge(PSHuman *object);

extern
void PSHumanSetAge(PSHuman *object, int *_age);

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
void PSHumanSetMother(PSHuman *object, PSHuman *_Mother);

extern
PSHuman *PSHumanGender(PSHuman *object);

#endif /* PSHuman_h */
