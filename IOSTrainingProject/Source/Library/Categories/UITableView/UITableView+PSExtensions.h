//
//  UITableView+PSExtensions.h
//  IOSTrainingProject
//
//  Created by Сергей on 2/29/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PSExtensions)

- (id)cellWithClass:(Class)cls;

- (void)updateTableView:(void(^)(UITableView *))block;

@end
