//
//  PSHuman.h
//  PSTrainingProject
//
//  Created by Сергей on 05.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSHuman_h
#define PSHuman_h

#pragma mark -
#pragma mark Private Decloration

const int PSChildrenCount = 20;

#pragma mark -
#pragma mark Public Decloration

typedef enum {
    PSHumanGenderMale,
    PSHumanGenderFemale
} PSHumanGender;

typedef struct PSHuman PSHuman;

struct PSHuman {
    char *_name;
    PSHuman *_partner;
    PSHuman *_father;
    PSHuman *_mather;
    PSHuman *_children[PSChildrenCount];
    PSHumanGender _gender;
    int _age;
};

extern
PSHuman *PSHumanCreate(void);

extern
void PSHumanDeallocate(PSHuman *human);

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

#endif /* PSHuman_h */
