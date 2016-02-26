//
//  PSUserCell.h
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSUser;

@interface PSUserCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel         *label;
@property (nonatomic, strong)   IBOutlet    UIImageView     *userImageView;

@property (nonatomic, strong)   PSUser    *user;

@end
