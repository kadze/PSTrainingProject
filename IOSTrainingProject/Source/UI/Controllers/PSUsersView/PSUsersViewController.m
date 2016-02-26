//
//  PSUsersViewController.m
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUsersViewController.h"

#import "UIViewController+PSExtensionsMacros.h"
#import "PSUsersView.h"
#import "PSUserCell.h"
#import "PSUsers.h"
#import "PSUser.h"

PSViewControllerBaseViewProperty(PSUsersViewController, PSUsersView, usersView)

@implementation PSUsersViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(PSUsers *)users {
    if (_users != users) {
        _users = users;
    }
    
    self.usersView.users = users;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.users = self.users;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onEditButton:(id)sender {
    PSUsersView *view = self.usersView;
    
    view.editing = !view.editing;
}


@end
