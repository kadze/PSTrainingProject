//
//  PSArrayDoubleIndexChangesModel+UITableView.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/4/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSArrayDoubleIndexChangesModel+UITableView.h"

#import "NSIndexPath+PSExtensions.h"
#import "UITableView+PSExtensions.h"

#import "PSArrayIndexChangesModel+UITableView.h"

#import "PSWeakifyMacros.h"

@implementation PSArrayDoubleIndexChangesModel (UITableView)

@dynamic toIndexPath;

- (NSIndexPath *)toIndexPath {
    return [NSIndexPath indexPathForRow:self.toIndex];
}

- (void)updateTableView:(UITableView *)tableView {
    NSIndexPath *indexPath = self.indexPath;
    NSIndexPath *toIndexPath = self.toIndexPath;
    NSArray *indexPathes = @[indexPath];
    NSArray *toIndexPathes = @[toIndexPath];
    PSWeakify(self);
    [tableView updateTableView:^(UITableView *object) {
        PSStrongify(self);
        switch (self.changeType) {
            case kPSArrayModelExchangeChanges:
                [tableView deleteRowsAtIndexPaths:indexPathes
                                 withRowAnimation:UITableViewRowAnimationRight];
                [tableView insertRowsAtIndexPaths:toIndexPathes
                                 withRowAnimation:UITableViewRowAnimationLeft];
                break;
                
            case kPSArrayModelMoveChanges:
                [tableView moveRowAtIndexPath:indexPath
                                  toIndexPath:toIndexPath];
                break;
                
            default:
                break;
        }
    }];
}

@end
