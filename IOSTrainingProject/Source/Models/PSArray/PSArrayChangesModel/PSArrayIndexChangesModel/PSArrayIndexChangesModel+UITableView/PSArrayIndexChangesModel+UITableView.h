//
//  PSArrayIndexChangesModel+UITableView.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/4/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSArrayIndexChangesModel.h"

@interface PSArrayIndexChangesModel (UITableView)
@property (nonatomic, readonly) NSIndexPath *indexPath;

@end
