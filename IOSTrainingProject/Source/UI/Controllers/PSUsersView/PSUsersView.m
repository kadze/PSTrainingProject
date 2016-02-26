//
//  PSUsersView.m
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUsersView.h"

#import "PSUsers.h"

@implementation PSUsersView

@dynamic editing;

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    [self.tableView setEditing:editing animated:YES];
}

- (BOOL)isEditing {
    return self.tableView.editing;
}

- (void)setUsers:(PSUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        
        _users = users;
        
        [_users addObserver:self];
        
        [self.tableView reloadData];
    }
}

@end
