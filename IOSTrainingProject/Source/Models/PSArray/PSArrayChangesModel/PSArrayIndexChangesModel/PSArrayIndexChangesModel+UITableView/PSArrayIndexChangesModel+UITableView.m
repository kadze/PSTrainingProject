//
//  PSArrayIndexChangesModel+UITableView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/4/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayIndexChangesModel+UITableView.h"

#import "NSIndexPath+PSExtensions.h"
#import "UITableView+PSExtensions.h"

#import "PSWeakifyMacros.h"

@implementation PSArrayIndexChangesModel (UITableView)

@dynamic indexPath;

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.fromIndex];
}

- (void)updateTableView:(UITableView *)tableView {
    NSIndexPath *indexPath = self.indexPath;
    NSArray *indexPathes = @[indexPath];
    PSWeakify(self);
    [tableView updateTableView:^(UITableView *object) {
        PSStrongify(self);
        switch (self.changeType) {
            case kPSArrayModelAddChanges:
                [tableView insertRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationTop];
                break;
                
            case kPSArrayModelInsertChanges:
                [tableView insertRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationTop];
                break;
                
            case kPSArrayModelRemoveChanges:
                [tableView deleteRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationRight];
                break;
                
            case kPSArrayModelReplaceChanges:
                [tableView reloadRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationMiddle];
                break;
                
            default:
                break;
        }
    }];
}

@end
