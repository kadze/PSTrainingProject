//
//  PSPrintValueOfPrimitiveTypeTest.c
//  PSTrainingProject
//
//  Created by Сергей on 22.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include "PSPrintValueOfPrimitiveTypeTest.h"
#include "PSPrintValueOfPrimitiveType.h"

PSPrintValueOfPrimitiveType(int, %d)
PSPrintValueOfPrimitiveType(char, %c)
PSPrintValueOfPrimitiveType(short, %d)
PSPrintValueOfPrimitiveType(long, %ld)

void PSPrintValueOfPrimitiveTypeTest(void){
    PSChallengePrintValueOfPrimitiveType(int, 123);
    PSChallengePrintValueOfPrimitiveType(char, 'q');
    PSChallengePrintValueOfPrimitiveType(short, 21);
    PSChallengePrintValueOfPrimitiveType(long, 2234234);
}