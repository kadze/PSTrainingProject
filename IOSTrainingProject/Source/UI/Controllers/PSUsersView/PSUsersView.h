//
//  PSUsersView.h
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSUsersView : UIView

@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;
@property (nonatomic, strong)   IBOutlet    UIButton        *editButton;

@property (nonatomic, assign, getter=isEditing)   BOOL    editing;

@end
