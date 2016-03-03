//
//  UITableView+PSArrayChangesModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSArrayChangesModel;

@interface UITableView (PSArrayChangesModel)

- (void)updateWithArrayChangeModel:(PSArrayChangesModel *)model;

@end
