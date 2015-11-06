//
//  PSString.h
//  PSTrainingProject
//
//  Created by Сергей on 04.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSString_h
#define PSString_h

#include "PSObject.h"

typedef struct {
    PSObject _super;
    char *_name;
} PSString;

extern
PSString *PSStringCreate(char *name);

extern
void __PSStringDeallocate(void *string);

extern
char *PSStringName(PSString *string);

extern
void PSStringSetName(PSString *string, char *name);

#endif /* PSString_h */
