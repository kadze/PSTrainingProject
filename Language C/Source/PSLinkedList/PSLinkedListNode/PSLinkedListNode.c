//
//  PSLinkedListNode.c
//  PSTrainingProject
//
//  Created by Сергей on 11.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#include "PSLinkedListNode.h"

#pragma mark -
#pragma mark Public Implementation

void __PSLinkedListNodeDeallocate(void *object) {
    
    __PSObjectDeallocate(object);
}

PSLinkedListNode *PSLinkedListNodeCreateWithObject(PSObject *object) {
    PSLinkedListNode *result = PSObjectCreateOfType(PSLinkedListNode);
    
    return result;
}

PSObject *PSLinkedListNodeGetObject(PSLinkedListNode *node);

void *PSLinkedListNodeSetObject(PSLinkedListNode *node, void *object);

PSLinkedListNode *PSLinkedListNodeGetNextNode(PSLinkedListNode *node);

void PSLinkedListNodeSetNextNode(PSLinkedListNode *node, PSLinkedListNode *nextNode);