//
//  PSArrayChangesModel+UITableView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayChangesModel+UITableView.h"

#import "UITableView+PSExtensions.h"
#import "NSIndexPath+PSExtensions.h"

@implementation PSArrayChangesModel (UITableView)

@dynamic indexPath;

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

- (void)updateTableView:(UITableView *)tableView {
    [tableView updateTableView:^(UITableView *object) {
    NSIndexPath *indexPath = self.indexPath;
    NSArray *indexPathes = @[indexPath];
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
                
            case kPSArrayModelExchangeChanges:
                [tableView deleteRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationRight];
                [tableView insertRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationLeft];
                break;
                
            case kPSArrayModelMoveChanges:
                [tableView moveRowAtIndexPath:indexPath
                                  toIndexPath:indexPath];
                break;
                
            default:
                break;
        }
    }];
}

@end
