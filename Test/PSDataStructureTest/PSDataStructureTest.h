//
//  PSDataStructureTest.h
//  PSTrainingProject
//
//  Created by Сергей on 22.10.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSDataStructureTest_h
#define PSDataStructureTest_h

#include <stdio.h>
#include <stddef.h>

extern
void PSDataStructureTest(void);

#define PSPrintOffsetOfStructure(structure, structureElement) \
    printf("Offset of: " #structureElement " = \t%lu\n", offsetof(structure, structureElement));

#define PSPrintOffsetOfStructureElements(structure) \
    PSPrintOffsetOfStructure(structure, string) \
    PSPrintOffsetOfStructure(structure, longLongValue) \
    PSPrintOffsetOfStructure(structure, doubleValue) \
    PSPrintOffsetOfStructure(structure, floatValue) \
    PSPrintOffsetOfStructure(structure, integerValue) \
    PSPrintOffsetOfStructure(structure, shortValue1) \
    PSPrintOffsetOfStructure(structure, shortValue2) \
    PSPrintOffsetOfStructure(structure, shortValue3) \
    PSPrintOffsetOfStructure(structure, bool1) \
    PSPrintOffsetOfStructure(structure, bool2) \
    PSPrintOffsetOfStructure(structure, bool3) \
    PSPrintOffsetOfStructure(structure, bool4) \
    PSPrintOffsetOfStructure(structure, bool5) \
    PSPrintOffsetOfStructure(structure, bool6);

#define PSPrintOffsetOfUnionElements(structure) \
    PSPrintOffsetOfStructure(structure, string) \
    PSPrintOffsetOfStructure(structure, longLongValue) \
    PSPrintOffsetOfStructure(structure, doubleValue) \
    PSPrintOffsetOfStructure(structure, floatValue) \
    PSPrintOffsetOfStructure(structure, integerValue) \
    PSPrintOffsetOfStructure(structure, shortValue1) \
    PSPrintOffsetOfStructure(structure, shortValue2) \
    PSPrintOffsetOfStructure(structure, shortValue3) \
    PSPrintOffsetOfStructure(structure, unionStructure);

#define PSPrintSizeOfDataType(type) \
    printf("Size Of: " #type " = \t%lu\n\n", sizeof(type));

#endif /* PSDataStructureTest_h */
