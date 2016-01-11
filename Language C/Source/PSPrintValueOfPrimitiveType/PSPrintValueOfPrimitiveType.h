//
//  PSPrintValueOfPrimitiveType.h
//  PSTrainingProject
//
//  Created by Сергей on 22.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSPrintValueOfPrimitiveType_h
#define PSPrintValueOfPrimitiveType_h

#define PSPrintValueOfPrimitiveType(type, specifier) \
    void output_ ## type(type value) { \
        printf("Output value of a primitive type " #type " = " #specifier "\n", value); \
    }

#define PSChallengePrintValueOfPrimitiveType(type, value) output_ ## type (value)

#endif /* PSPrintValueOfPrimitiveType_h */
