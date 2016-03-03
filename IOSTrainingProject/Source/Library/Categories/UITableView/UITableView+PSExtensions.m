//
//  UITableView+PSExtensions.m
//  IOSTrainingProject
//
//  Created by Сергей on 2/29/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "UITableView+PSExtensions.h"

#import "UINib+PSExtensions.h"

#import "PSReturnMacros.h"

@implementation UITableView (PSExtensions)

- (id)cellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

- (void)updateTableView:(void(^)(UITableView *))block {
    PSReturnIfNil(block);
    
    [self beginUpdates];
    block(self);
    [self endUpdates];
}

@end
