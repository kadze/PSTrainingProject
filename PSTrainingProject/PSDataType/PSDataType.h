//
//  PSDataType.h
//  PSTrainingProject
//
//  Created by Сергей on 24.09.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSDataType_h
#define PSDataType_h

#include <stdio.h>

extern
void PSDataTypes(void);

#define PSPrintSizeOfDataType(type) \
    printf("Size Of: " #type " = %lu\n", sizeof(type));

#endif
