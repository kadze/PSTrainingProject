//
//  PSUsersViewController.h
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSUsers;

@interface PSUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   PSUsers *users;

- (IBAction)onEditButton:(id)sender;

@end
