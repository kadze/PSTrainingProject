//
//  PSTableView.m
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSTableView.h"

@implementation PSTableView

@dynamic editing;

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    [self.tableView setEditing:editing animated:YES];
}

- (BOOL)isEditing {
    return self.tableView.editing;
}

@end
