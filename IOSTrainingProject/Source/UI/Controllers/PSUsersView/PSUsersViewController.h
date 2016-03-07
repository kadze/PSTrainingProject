//
//  PSUsersViewController.h
//  IOSTrainingProject
//
//  Created by Сергей on 18.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSModelProtocol.h"

@class PSUsers;

@interface PSUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, PSModelProtocol>
@property (nonatomic, strong)   PSUsers *users;

- (IBAction)onEditButton:(id)sender;

@end
