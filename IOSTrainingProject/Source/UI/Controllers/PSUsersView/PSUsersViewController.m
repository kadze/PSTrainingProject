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

PSViewControllerBaseViewProperty(PSUsersViewController, PSUsersView, userView)

@implementation PSUsersViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onEditButton:(id)sender {
    PSUsersView *view = self.userView;
    
    view.editing = !view.editing;
}

@end
