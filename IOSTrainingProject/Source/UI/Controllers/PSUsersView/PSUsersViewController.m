//
//  PSUsersViewController.m
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUsersViewController.h"

#import "PSUsersView.h"
#import "PSUserCell.h"
#import "PSUsers.h"
#import "PSUser.h"
#import "PSArray.h"
#import "PSView.h"
#import "PSDispatch.h"

#import "UIViewController+PSExtensionsMacros.h"
#import "UITableView+PSExtensions.h"
#import "PSArrayChangesModel+UITableView.h"
#import "UITableView+PSArrayChangesModel.h"

PSViewControllerBaseViewProperty(PSUsersViewController, PSUsersView, usersView)

@implementation PSUsersViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(PSUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        _users = users;
        [_users addObserver:self];
        [_users load];
    }
    
    self.usersView.users = users;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.users load];
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

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSUserCell *cell = [tableView cellWithClass:[PSUserCell class]];
    cell.user = [self.users objectAtIndex:indexPath.row];
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL result = indexPath.row == self.users.count - 1;
    
    return result ? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    PSUsers *users = self.users;
    
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [users removeObjectAtIndex:indexPath.row];
    } else if (UITableViewCellEditingStyleInsert == editingStyle) {
        [users addObject:[PSUser new]];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark PSModelObserver

- (void)modelWillLoad:(id)model {
    PSDispatchAsyncOnMainThread(^{
        [self.usersView showLoadingView];
    });
}

- (void)modelDidLoad:(id)model {
    PSUsersView *usersView = self.usersView;
    PSDispatchAsyncOnMainThread(^{
        [usersView.tableView reloadData];
        [usersView hideLoadingView];
    });
}

- (void)collection:(id)collection didChangeWithModel:(id)changeModel {
    UITableView *tableView = self.usersView.tableView;
    [tableView updateWithArrayChangeModel:changeModel];
}

@end
