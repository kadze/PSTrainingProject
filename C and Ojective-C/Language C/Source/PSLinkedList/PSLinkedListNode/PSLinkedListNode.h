//
//  PSLinkedListNode.h
//  PSTrainingProject
//
//  Created by Сергей on 11.11.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#ifndef PSLinkedListNode_h
#define PSLinkedListNode_h

#include <stdio.h>

#include "PSObject.h"

typedef struct PSLinkedListNode PSLinkedListNode;

struct PSLinkedListNode {
    PSObject _super;
    PSLinkedListNode *_nextNode;
    void *_object;
};

extern
void __PSLinkedListNodeDeallocate(void *object);

extern
PSLinkedListNode *PSLinkedListNodeCreateWithObject(PSObject *object);

extern
PSLinkedListNode *PSLinkedListNodeGetNextNode(PSLinkedListNode *node);

extern
void PSLinkedListNodeSetNextNode(PSLinkedListNode *node, PSLinkedListNode *nextNode);

extern
PSObject *PSLinkedListNodeGetObject(PSLinkedListNode *node);

extern
void *PSLinkedListNodeSetObject(PSLinkedListNode *node, void *object);

#endif /* PSLinkedListNode_h */
