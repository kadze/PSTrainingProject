//
//  PSDataStructureTest.c
//  PSTrainingProject
//
//  Created by Сергей on 22.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include "PSDataStructureTest.h"
#include "PSDataStructure.h"

void PSDataStructureTest(void) {
    PSPrintOffsetOfStructureElements(PSDataRandomly);
    PSPrintSizeOfDataType(PSDataRandomly);
    
    PSPrintOffsetOfStructureElements(PSOptimizedData);
    PSPrintSizeOfDataType(PSOptimizedData);
    
    PSPrintOffsetOfUnionElements(PSOptimizedUnion);
    PSPrintSizeOfDataType(PSOptimizedUnion);
}