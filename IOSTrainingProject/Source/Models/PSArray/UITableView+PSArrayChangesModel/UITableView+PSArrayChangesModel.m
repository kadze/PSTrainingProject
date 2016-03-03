//
//  UITableView+PSArrayChangesModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "UITableView+PSArrayChangesModel.h"

#import "PSArrayChangesModel+UITableView.h"

@implementation UITableView (PSArrayChangesModel)

- (void)updateWithArrayChangeModel:(PSArrayChangesModel *)model {
    [model updateTableView:self];
}

@end
