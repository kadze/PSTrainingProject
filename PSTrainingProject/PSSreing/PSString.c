//
//  PSString.c
//  PSTrainingProject
//
//  Created by Сергей on 04.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include <stdlib.h>
#include <string.h>
#include "PSString.h"
#include "PSObject.h"

#pragma mark -
#pragma mark Initialization & Deallocation

void PSStringDeallocate(void *string) {
    PSStringSetName(string, NULL);
    
    __PSObjectDeallocate(string);
};

PSString *PSStringCreate(char *name) {
    PSString *result = PSObjectCreateOfType(PSString);
    
    return result;
};

#pragma mark -
#pragma mark Accessors

char *PSStringName(PSString *string) {
    return NULL != string ? string->_name : NULL;
}

void PSStringSetName(PSString *string, char *name) {
    if (NULL != string) {
        if (NULL != string->_name) {
            free(string->_name);
            string->_name = NULL;
        }
        
        if (name) {
            string->_name = strdup(name);
        }
    }
}