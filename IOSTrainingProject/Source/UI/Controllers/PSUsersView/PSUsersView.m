//
//  PSUsersView.m
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUsersView.h"

#import "PSUsers.h"

static NSString * const kPSButtonTitleEdit = @"Edit";
static NSString * const kPSButtonTitleDone = @"Done";

@implementation PSUsersView

@dynamic editing;

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    UIButton *editButton = self.editButton;
    @synchronized(self) {
        [self.tableView setEditing:editing animated:YES];
        editButton.backgroundColor = editing ? [UIColor redColor] : [UIColor greenColor];
        [editButton setTitle:(editing ? kPSButtonTitleDone : kPSButtonTitleEdit)
                    forState:UIControlStateNormal];
    }
}

- (BOOL)isEditing {
    return self.tableView.editing;
}

@end
